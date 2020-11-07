using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TargetAssembly
{
    /// <summary>Struct</summary>
    public struct TargetStruct
    {
        /// <summary>Constant</summary>
        public const string targetConstant = "constant";

        /// <summary>Event</summary>
        public event Action TargetEvent;

        /// <summary>Field</summary>
        public int targetField;

        /// <summary>Static Member</summary>
        public static int targetStaticMember;

        /// <summary>Property</summary>
        public int TargetProperty { get; set; }

        /// <summary>Constructor</summary>
        public TargetStruct(int value) {
            TargetEvent = null;
            targetField = 0;
            TargetProperty = 0;
        }

        /// <summary>Method</summary>
        public void TargetMethod() { }

        /// <summary>Static Method</summary>
        public static void TargetStaticMethod() { }
    }
}
