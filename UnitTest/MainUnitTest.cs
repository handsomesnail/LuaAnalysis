using System;
using System.Collections.Generic;
using System.Reflection;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using LuaAnalysis;

namespace UnitTest
{
    [TestClass]
    public class MainUnitTest
    { 

        [TestMethod]
        public void TestMethod1()
        {
            //Type type = typeof(TargetAssembly.TargetClass);
            LuaAnalyzer.Test();
        }

        [TestMethod]
        public void TestMethod2()
        {
            ICollection<Assembly> targetAssemblies = new List<Assembly>() { Assembly.Load("TargetAssembly") };
            LuaAnalyzer luaAnalyzer = new LuaAnalyzer(targetAssemblies);
        }

    }
}
