using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace LuaAnalysisTool.Common
{
    /// <summary>x64架构16Byte</summary>
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Ansi)]
    internal struct RefData
    {
        //LPStr: ANSI字符数组；LPWStr: Unicode字符数组；
        //LPTStr：与平台相关的字符数组；ByValTStr：定长字符数组，数组的类型由结构指定的字符集(CharSet)确定
        /// <summary>引用类型字符串，如"UnityEngine.Vector3"</summary>
        [MarshalAs(UnmanagedType.LPStr)]
        public string refStr; //不是简单的refStr 测试用例需要考虑这几种情况：1.构造函数调用 2.静态方法 3.静态方法调用 4.静态成员(非方法，如字段) 5.直接类型引用

        /// <summary>行号</summary>
        public int line;
    }

    /// <summary>x64架构16Byte</summary>
    [StructLayout(LayoutKind.Sequential)]
    internal struct RefDataArray
    {
        /// <summary>RefData数组的首地址</summary>
        public IntPtr refDataPtr;
        /// <summary>数组元素数量</summary>
        public int count;
    }

}
