using LuaAnalysisTool.Common;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using UnityEngine.SocialPlatforms;
#if UNITY_PUBLISH
using UnityEngine;
#endif

namespace LuaAnalysis
{
    public enum LogLevel
    {
        Debug = 0,
        Message = 1,
        Warning = 2,
        Error = 3,
    }

    public enum ExecuteMode
    {
        Independent = 0,
        Attached = 1,
    }

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    public delegate void OutputStrDelegate(string str, int level);

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    public delegate int CheckExternSymbolDelegate(string str);

    public class LuaAnalyzer : IDisposable
    {
        private bool disposed = false;

        /// <summary>用于静态分析的独立AppDomain</summary>
        private AppDomain analysisAppDomain;

        private ICollection<Assembly> attachedAssemblies;

        private ExecuteMode executeMode;

        private HashSet<string> injectSymbols = new HashSet<string>();

        private static OutputStrDelegate logToFileCallback;

        private LuaAnalyzer() { }

        static LuaAnalyzer()
        {
            Redirect(Output);
        }

        public LuaAnalyzer(ICollection<Assembly> assemblies, ExecuteMode executeMode, OutputStrDelegate callback) : this()
        {
            logToFileCallback = callback;
            this.executeMode = executeMode;
            if(executeMode == ExecuteMode.Independent)
            {
                analysisAppDomain = AppDomain.CreateDomain("AnalysisAppDomain");
                foreach (Assembly assembly in assemblies)
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
                            Output("load assembly error\n", 3);
                        }
                    }
                    catch (Exception e)
                    {
                        Output("load assembly error:" + e + "\n", 3);
                    }
                }
            }
            else if(executeMode == ExecuteMode.Attached)
            {
                this.attachedAssemblies = assemblies;
            }

        }

        ~LuaAnalyzer()
        {
            Dispose(false);
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
            if (executeMode == ExecuteMode.Independent && analysisAppDomain != null)
            {
                AppDomain.Unload(analysisAppDomain);
            }
            disposed = true;
        }

        /// <summary>从UnityEditor调用</summary>
        public static LuaAnalyzer CreateUnityLuaAnalyzer(ExecuteMode executeMode, OutputStrDelegate callback)
        {
            List<Assembly> assemblies = new List<Assembly>();
            assemblies.Add(Assembly.Load("mscorlib"));
            assemblies.Add(Assembly.Load("System"));
            assemblies.Add(Assembly.Load("System.Core"));
            assemblies.Add(Assembly.Load("Assembly-CSharp"));
            assemblies.Add(Assembly.Load("Assembly-CSharp-firstpass"));
            assemblies.Add(Assembly.Load("UnityEngine"));
            assemblies.Add(Assembly.Load("UnityEngine.UI"));
            return new LuaAnalyzer(assemblies, executeMode, callback);
        }

        [DllImport("luacompiler", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        private static extern int Execute([MarshalAs(UnmanagedType.LPStr)]string name, [MarshalAs(UnmanagedType.LPStr)]string content, 
            [MarshalAs(UnmanagedType.FunctionPtr)]CheckExternSymbolDelegate checkStaticSymbolCallback,
            [MarshalAs(UnmanagedType.FunctionPtr)]CheckExternSymbolDelegate checkInstanceSymbolCallback);

        [DllImport("luacompiler", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        private static extern IntPtr GetRefData([MarshalAs(UnmanagedType.LPStr)]string content);

        [DllImport("luacompiler", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        private static extern void Redirect([MarshalAs(UnmanagedType.FunctionPtr)]OutputStrDelegate callback);

        private static void Output([MarshalAs(UnmanagedType.LPStr)]string message, int level)
        {
#if UNITY_PUBLISH
            if(level == (int)LogLevel.Debug) 
            {
                return;
            }
            if (level == (int)LogLevel.Message)
            {
                Debug.Log(message);
            }
            else if(level == (int)LogLevel.Warning)
            {
                Debug.LogWarning(message);
            }
            else if(level == (int)LogLevel.Error)
            {
                Debug.LogError(message);
            }
#else
            Console.Write(message);
#endif
            if (logToFileCallback != null)
            {
                logToFileCallback(message, level);
            }
        }

        private static void Print(string message)
        {
            Output(message, (int)LogLevel.Debug);
        }

        public int Execute(string name, string input) {
            return Execute(name, input, CheckExternStaticSymbol, CheckExternInstanceSymbol);
        }

#if UNITY_PUBLISH
        public int Execute(TextAsset textAsset) {
            return Execute(textAsset.name, textAsset.text);
        }
#endif

        public void InjectSymbol(ICollection<string> injections) {
            injectSymbols = new HashSet<string>();
            foreach(string injection in injections) {
                if (!injectSymbols.Contains(injection)) {
                    injectSymbols.Add(injection);
                }
            }
        }

        private int CheckExternStaticSymbol(string symbol) {
            if (string.IsNullOrEmpty(symbol))
            {
                return -3;
            }
            //递归到类的成员即可返回true
            string[] array = symbol.Split('.');
            Type typeGetted = null;
            StringBuilder sb = new StringBuilder();
            foreach(string s in array) {
                if (typeGetted == null) {
                    if (sb.ToString() != string.Empty) {
                        sb.Append('.');
                    }
                    sb.Append(s);
                    typeGetted = FindType(sb.ToString());
                }
                else {
                    if (FindMember(typeGetted, s))
                        return 0;
                    else return -2; //get type, get no member
                }
            }
            if (typeGetted != null)
                return 0;
            else return -1; //get no type
        }

        private int CheckExternInstanceSymbol(string symbol) {
            if (string.IsNullOrEmpty(symbol))
            {
                return -3;
            }
            string instance = symbol.Split('.')[0];
            if (injectSymbols.Contains(instance)) {
                return 0;
            }
            else return -1;
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

        private Type FindType(string className, bool isQualifiedName = false)
        {
            ICollection<Assembly> targetAssembly = null;
            if(executeMode == ExecuteMode.Independent)
            {
                targetAssembly = analysisAppDomain.GetAssemblies();
            }
            else if(executeMode == ExecuteMode.Attached)
            {
                targetAssembly = attachedAssemblies;
            }
            foreach (Assembly assembly in targetAssembly)
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

        private bool FindMember(Type type, string memberName) {
            BindingFlags flag = BindingFlags.Static | BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic;
            if (type.GetMember(memberName, flag).Length == 0)
            {
                if (type.BaseType == null)
                {
                    return false;
                }
                else return FindMember(type.BaseType, memberName);
            }
            else return true;
        }

    }

}