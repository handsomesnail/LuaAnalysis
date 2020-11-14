using System;
using System.Collections.Generic;
using System.Reflection;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using LuaAnalysis;
using System.IO;

namespace UnitTest
{
    [TestClass]
    public class MainUnitTest
    { 

        [TestMethod]
        public void TestMethod1()
        {
            string scriptStr = IOUtil.Read("LuaSource", "input1.lua");
            LuaAnalyzer.TestMethod(scriptStr);
        }

        [TestMethod]
        public void TestMethod2()
        {
            ICollection<Assembly> targetAssemblies = new List<Assembly>() { Assembly.Load("TargetAssembly") };
            LuaAnalyzer luaAnalyzer = new LuaAnalyzer(targetAssemblies);
        }

        //TODO: 内存泄漏，内存占用量

    }
}
