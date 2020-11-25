# LuaAnalysis
lua脚本静态分析工具0.0000001, 编译器部分使用lua官方5.3.5版本。  

* 环境(Windows)  
开发环境visual studio 2019，需要安装.Net桌面开发包和C++桌面开发包。

* 构建(Windows)  
因为使用C#和C/C++混编，平台仅支持**x64**和**x86**生成，Any CPU下默认使用**x64**生成。使用UnitTest测试时使用Debug/Release配置，在构建前需要通过所有测试用例，然后可以使用**UnityPublish**配置针对Unity分别输出`luacompiler.dll`和`LuaAnalysisTool.dll`，即可导入Unity使用。

* MacOS  
开发和调试阶段推荐使用windows，需要输出macos的动态链接库时可以在mac上编译源码。
