# LuaAnalysis
lua脚本静态分析工具0.1, 编译器部分使用lua官方5.3.5版本，《lua设计与实现》一书中使用的lua版本为5.1.4，相较来说opcode有少许不同，但是绝大部分都可以参考。  

* 环境(Windows)  
开发环境visual studio 2019，需要安装.Net桌面开发包和C++桌面开发包。

* 构建(Windows)  
因为使用C#和C/C++混编，平台仅支持**x64**和**x86**生成，Any CPU下默认使用**x64**生成。使用UnitTest测试时使用Debug/Release配置，在构建前需要通过所有测试用例，然后可以使用**UnityPublish**配置针对Unity分别输出`luacompiler.dll`和`LuaAnalysisTool.dll`，即可导入Unity使用。

* MacOS  
目前开发阶段只能使用visual studio调试和构建`Windows`版本，理论上支持构建`MacOS`版本。
