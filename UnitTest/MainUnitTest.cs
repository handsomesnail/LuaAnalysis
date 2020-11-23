using System;
using System.Collections.Generic;
using System.Reflection;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using LuaAnalysis;
using System.IO;
using System.Diagnostics;

namespace UnitTest
{
    [TestClass]
    public class MainUnitTest
    { 

        [TestMethod]
        public void TestMethod1()
        {
            string fileName = "input1.lua";
            string scriptStr = IOUtil.Read("LuaSource", fileName);
            ICollection<Assembly> targetAssemblies = new List<Assembly>() { Assembly.Load("TargetAssembly") };
            LuaAnalyzer luaAnalyzer = new LuaAnalyzer(targetAssemblies, ExecuteMode.Attached, null);
            List<string> injections = new List<string>() { "t" };
            luaAnalyzer.InjectSymbol(injections);
            luaAnalyzer.Execute(fileName, scriptStr);
        }

        [TestMethod]
        public void TestMethod2()
        {
            string fileName = "input2.lua";
            string scriptStr = IOUtil.Read("LuaSource", fileName);
            ICollection<Assembly> targetAssemblies = new List<Assembly>() { Assembly.Load("TargetAssembly") };
            LuaAnalyzer luaAnalyzer = new LuaAnalyzer(targetAssemblies, ExecuteMode.Attached, null);
            luaAnalyzer.Execute(fileName, scriptStr);
        }

        //TODO: 内存泄漏，内存占用量

        private float GetMemoryUsed()
        {
            string name = Process.GetCurrentProcess().ProcessName;
            PerformanceCounter ramCounter = new PerformanceCounter("Process", "Working Set", name);
            float value = ramCounter.NextValue();
            ramCounter.Close();
            return value;
        }

    }
}
