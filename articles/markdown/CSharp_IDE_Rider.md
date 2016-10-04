
## Rider

    说起C#的IDE，脑海中闪现的便是VS。
    VS身为"地表最强IDE“的确十分出色，而且众所周知，在这里就不赘述了。
    我今天要说是JetBrains最新退出的C#IDE--Rider。

1. 跨平台(这是我关注她的初因)

2. 集成[ReSharper](https://www.jetbrains.com/resharper/)的功能(you don`t konw?)

3. 暂时没想到

##### 起因：
说起ReSharper来，我shi用她还是因为王垠前辈的一篇[文章](http://www.yinwang.org/blog-cn/2016/09/18/rust)，这里面谈到了C#里面的var关键词。
看完这篇文章以后我想了一两天，感觉应该存在一种存在，可以解决文中的那个问题[注1],于是我想起了jb的那个插件，抱着试试看的态度(mdzz，怎么都感觉像托～)。
果不其然，还真已经被Resharper解决了。


此后，在闲暇之时研究了几天ReSharper发现了几个比较有趣(用)的future：

    - 重构类或者接口到一个新文件。
    - 计算linq表达式。(计算量大了会很卡很卡的，比如说db.some.tolist())
    - 根据类型和位置提示一个比较清晰的变量名。
    - 一时卡壳，待续狗尾。

上面说ReSharper那些功能在Rider都有，也就是说Rider集成了ReSharper的所有功能？(这个我真没有一一验证(--!))
不过目前Rider还处于开发测试阶段，可以申请使(试？)用。按照jb的一贯风格，正式版应该要收费的。(跪求出community edition)

目前Rider中新建项目只有.Net和.Net Core的类库和控制台程序，可是能调试运行我用VS建立的MVC项目#24。

虽说是跨平台，但是我在ubuntu16.04 gnome edition上居然build失败。可恨又可恶，看你是测试版，我忍了。

最后说一句，Rider使用java写的2333333333333333333















[注1] 在看 C# 代码的时候，我经常看到一堆的变量定义，每一个的前面都是 var。我没法一眼就看出它们表示什么，是整数，bool，还是字符串，还是某个用户定义的类？