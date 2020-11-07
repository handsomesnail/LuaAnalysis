using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LuaAnalysisTool.LuaModule
{
    internal class Node
    {
        public static readonly Node FunctionNode = new Node(LuaType.LUA_TFUNCTION); //类型构造函数和类型方法均转为该节点

        public LuaType Type { private set; get; }

        public Node(LuaType type)
        {
            this.Type = type;
        }

        public Node(int value)
        {
            this.Type = LuaType.LUA_TNUMBER;
        }

        public Node(float value)
        {
            this.Type = LuaType.LUA_TNUMBER;
        }

    }
}
