using LuaAnalysisTool.Common;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
#if UNITY_PUBLISH
using UnityEngine;
#endif

namespace LuaAnalysis
{

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    public delegate void OutputStrDelegate(string str);

    public class LuaAnalyzer : IDisposable
    {
        private bool disposed = false;

        /// <summary>用于静态分析的独立AppDomain</summary>
        private AppDomain analysisAppDomain;

        public LuaAnalyzer()
        {
        }

        static LuaAnalyzer()
        {
            Redirect(Print);
        }

        public LuaAnalyzer(ICollection<Assembly> assemblies) : this()
        {
            analysisAppDomain = AppDomain.CreateDomain("AnalysisAppDomain");
            foreach(Assembly assembly in assemblies)
            {
                try
                {
                    byte[] rawAssembly = File.ReadAllBytes(assembly.Location);
                    Assembly loadedAssembly = null;
                    try
                    {
                        loadedAssembly = analysisAppDomain.Load(rawAssembly);
                    }
                    catch (BadImageFormatException)
                    {
                        // The assemblyName was invalid.  It is most likely a path.
                    }
                    if (assembly == null)
                    {
                        Print("load assembly error");
                    }
                }
                catch (Exception e)
                {
                    Print("load assembly error:" + e);
                }
            }
        }

        ~LuaAnalyzer()
        {
            Dispose(false);
            Print("Finilze");
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposed)
            {
                return;
            }
            if (analysisAppDomain != null)
            {
                AppDomain.Unload(analysisAppDomain);
            }
            disposed = true;
        }

        /// <summary>从UnityEditor调用</summary>
        public static LuaAnalyzer CreateUnityLuaAnalyzer()
        {
            List<Assembly> assemblies = new List<Assembly>();
            assemblies.Add(Assembly.Load("mscorlib"));
            assemblies.Add(Assembly.Load("System"));
            assemblies.Add(Assembly.Load("System.Core"));
            assemblies.Add(Assembly.Load("Assembly-CSharp"));
            assemblies.Add(Assembly.Load("UnityEngine"));
            assemblies.Add(Assembly.Load("UnityEngine.UI"));
            return new LuaAnalyzer(assemblies);
        }

        public static void Test()
        {
            Print(Test("aaa").ToString());
        }

        [DllImport("luacompiler", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        private static extern int Test([MarshalAs(UnmanagedType.LPStr)]string content);

        [DllImport("luacompiler", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        private static extern IntPtr GetRefData([MarshalAs(UnmanagedType.LPStr)]string content);

        [DllImport("luacompiler", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        private static extern IntPtr Execute([MarshalAs(UnmanagedType.LPStr)]string content);

        [DllImport("luacompiler", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        private static extern void Redirect([MarshalAs(UnmanagedType.FunctionPtr)]OutputStrDelegate callback);

        private static void Print([MarshalAs(UnmanagedType.LPStr)]string message)
        {
#if UNITY_PUBLISH
            Debug.Log(message);
#else
            Console.WriteLine(message);
#endif
        }

        private static RefData[] ParseRefData(IntPtr ptr)
        {
            RefDataArray refDataArray = (RefDataArray)Marshal.PtrToStructure(ptr, typeof(RefDataArray));
            int size = Marshal.SizeOf(typeof(RefData));
            int count = refDataArray.count;
            RefData[] output = new RefData[count];
            for (int i=0; i<count; i++) 
            {
                IntPtr tempPtr = IntPtr.Zero;
                if(IntPtr.Size == 4) //x86
                {
                    tempPtr = new IntPtr(ptr.ToInt32() + i * size);
                }
                else if(IntPtr.Size == 8) //x64
                {
                    tempPtr = new IntPtr(ptr.ToInt64() + i * size);
                }
                output[i] = (RefData)Marshal.PtrToStructure(tempPtr, typeof(RefData));
            }
            return output;
        }

        /// <summary>检查lua脚本对C#的错误引用</summary>
        /// <param name="name">lua文件名</param>
        /// <param name="content">lua脚本内容</param>
        /// <returns>错误数量</returns>
        public int CheckCSharpRefByLua(string name, string content)
        {
            int errorCount = 0;
            //从inputLuaScrips中拿到一个结构 内容包括访问的C#名 lua行号
            IntPtr refDataArrayPtr = GetRefData(content);
            RefData[] refDataArr = ParseRefData(refDataArrayPtr);
            foreach(RefData refData in refDataArr)
            {
                string refStr = refData.refStr;
                foreach(Assembly assembly in analysisAppDomain.GetAssemblies())
                {

                }
            }
            return errorCount;
        }

        private Type FindType(string className, bool isQualifiedName = false)
        {
            foreach (Assembly assembly in analysisAppDomain.GetAssemblies())
            {
                Type klass = assembly.GetType(className);

                if (klass != null)
                {
                    return klass;
                }
            }
            int p1 = className.IndexOf('[');
            if (p1 > 0 && !isQualifiedName)
            {
                string qualified_name = className.Substring(0, p1 + 1);
                string[] generic_params = className.Substring(p1 + 1, className.Length - qualified_name.Length - 1).Split(',');
                for (int i = 0; i < generic_params.Length; i++)
                {
                    Type generic_param = FindType(generic_params[i].Trim());
                    if (generic_param == null)
                    {
                        return null;
                    }
                    if (i != 0)
                    {
                        qualified_name += ", ";
                    }
                    qualified_name = qualified_name + "[" + generic_param.AssemblyQualifiedName + "]";
                }
                qualified_name += "]";
                return FindType(qualified_name, true);
            }
            return null;
        }

        private bool FindStaticMember(Type type, string memberName)
        {
            return type.GetMember(memberName, BindingFlags.Static).Length != 0;
        }

#if UNITY_PUBLISH
        public int CheckCSharpRefByLua(ICollection<TextAsset> inputLuaScripts)
        {
            int errorCount = 0;
            foreach (TextAsset luaScript in inputLuaScripts)
            {
                int count = CheckCSharpRefByLua(luaScript.name, luaScript.text);
                if (count > 0)
                {
                    errorCount += count;
                }
            }
            return errorCount;
        }
#endif

        public int CheckCSharpRefByLua(ICollection<KeyValuePair<string, string>> inputLuaScripts)
        {
            int errorCount = 0;
            foreach (KeyValuePair<string, string> luaScript in inputLuaScripts)
            {
                int count = CheckCSharpRefByLua(luaScript.Key, luaScript.Value);
                if (count > 0)
                {
                    errorCount += count;
                }
            }
            return errorCount;
        }

    }

}