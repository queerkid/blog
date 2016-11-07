% foreach vs ForEach

> 人生何时不可学，世间何处无可学。

1.

&emsp;&emsp;&emsp;&emsp; A number of people have asked me why there is no Microsoft-provided "ForEach" sequence operator extension method.

&emsp;&emsp;&emsp;&emsp; 很多人问我为什么有非微软提供的操作序列的"ForEach"扩展方法。

&emsp;&emsp;&emsp;&emsp; The List\<T> class has such a method already of course, but there’s no reason why such a method could not be created as an extension method for all sequences. 

&emsp;&emsp;&emsp;&emsp; 当然，List\<T>类已经有这个方法了，但是没有理由不能创建一个这样的方法作为所有序列的扩展方法。

&emsp;&emsp;&emsp;&emsp; It’s practically a one-liner:

&emsp;&emsp;&emsp;&emsp; 这几乎是一行：
```
	public static void ForEach<T>(this IEnumerable<T> sequence, Action<T> action)
	{ 
		// argument null checking omitted
		foreach(T item in sequence) action(item);
	}
```
2. 

&emsp;&emsp;&emsp;&emsp; My usual response to "why is feature X not implemented?" is that of course [all features are unimplemented](https://blog.ryjones.org/2005/07/12/product-development/)[^404ed] until someone designs,implements,tests,documents and ships the feature, and no one has yet spent the money to do so.
 
&emsp;&emsp;&emsp;&emsp; 我通常对“为什么某功能没实现？”的回应是：所有的功能都是未实现的，直到有人设计、实现、测试、描述、发布这个功能，以及还没有人花钱来做这些。

&emsp;&emsp;&emsp;&emsp; though I have famously pointed out that [even small features can have large costs](https://blogs.msdn.microsoft.com/ericlippert/2003/10/28/how-many-microsoft-employees-does-it-take-to-change-a-lightbulb/),this one really is dead easy,obviously correct,easy to test,and easy to documents.

&emsp;&emsp;&emsp;&emsp; 虽然我有公开地指出即使很小的功能也可以有巨大的成本，这真的容易透了，显而易见，容易测试，容易描述。

&emsp;&emsp;&emsp;&emsp; Costs is always a factor of course, but the costs for this one really are quite small.

&emsp;&emsp;&emsp;&emsp; 成本总是一个因素，但是这个功能的成本真的很小。

3.

&emsp;&emsp;&emsp;&emsp; Of course, that cuts the other way too. 

&emsp;&emsp;&emsp;&emsp; 当然，这也走向了另一个方向。

&emsp;&emsp;&emsp;&emsp; If it is so cheap and easy, then you can do it yourself if you need it. 

&emsp;&emsp;&emsp;&emsp; 如果它是如此便宜和容易，那么你可以自己做，如果你需要它。

&emsp;&emsp;&emsp;&emsp; And really what matters is not the low cost, but rather the net benefit. 

&emsp;&emsp;&emsp;&emsp; 真正重要的不是低成本，而是净收益。

&emsp;&emsp;&emsp;&emsp; As we’ll see, I think the benefits are also very small, and therefore the net benefit might in fact be negative. 

&emsp;&emsp;&emsp;&emsp; 正如我们将看到的，我认为好处也很小,因此净收益实际上可能是负的。

&emsp;&emsp;&emsp;&emsp; But we can go a bit deeper here. I am philosophically opposed to providing such a method, for two reasons.

&emsp;&emsp;&emsp;&emsp; 但我们可以在这里更深一点。 我哲学上反对提供这种方法，有两个原因。

4.

&emsp;&emsp;&emsp;&emsp; The first reason is that doing so violates the functional programming principles that all the other sequence operators are based upon.

&emsp;&emsp;&emsp;&emsp; 第一个原因是这样做违反了所有其他序列运算符所基于的函数编程原则。

&emsp;&emsp;&emsp;&emsp; Clearly the sole purpose of a call to this method is to cause side effects. 

&emsp;&emsp;&emsp;&emsp; 显然，调用该方法的唯一目的是引起副作用。

&emsp;&emsp;&emsp;&emsp; The purpose of an expression is to compute a value, not to cause a side effect. 

&emsp;&emsp;&emsp;&emsp; 表达式的目的是计算一个值，而不是引起副作用。

&emsp;&emsp;&emsp;&emsp; The purpose of a statement is to cause a side effect. The call site of this thing would look an awful lot like an expression 

&emsp;&emsp;&emsp;&emsp; 声明的目的是引起副作用。调用这个东西看起来很像的一个表达式

&emsp;&emsp;&emsp;&emsp; (though, admittedly, since the method is void-returning, the expression could only be used in a “statement expression” context.) 

&emsp;&emsp;&emsp;&emsp; （不过，不可否认，由于该方法是返回空，这个表达式可能只用于"语句表达式"上下文。）

&emsp;&emsp;&emsp;&emsp; It does not sit well with me to make the one and only sequence operator that is only useful for its side effects.

&emsp;&emsp;&emsp;&emsp; 这个只有副作用有用的序列操作符不太适合我。

5.

&emsp;&emsp;&emsp;&emsp; The second reason is that doing so adds zero new representational power to the language. Doing this lets you rewrite this perfectly clear code:

&emsp;&emsp;&emsp;&emsp; 第二个原因是,这样做没有增加新的表达能力到这个语言。这样做可以让你重写这个完美清晰的代码:

``` 
	foreach(Foo foo in foos){ statement involving foo; }
```
&emsp;&emsp;&emsp;&emsp; into this code:
```
	foos.ForEach((Foo foo)=>{ statement involving foo; });
```
&emsp;&emsp;&emsp;&emsp; which uses almost exactly the same characters in slightly different order. And yet the second version is harder to understand, harder to debug, and introduces closure semantics, thereby potentially changing object lifetimes in subtle ways.

&emsp;&emsp;&emsp;&emsp; 这两种使用几乎完全相同的字符，只是顺序略有不同。但第二个版本更难理解，更难去调试，并引入了闭包语义，从而有可能以微妙的方式改变对象生存周期。

&emsp;&emsp;&emsp;&emsp; When we provide two subtly different ways to do exactly the same thing, we produce confusion in the industry, we make it harder for people to read each other’s code, and so on. 

&emsp;&emsp;&emsp;&emsp; 当我们提供两种完全不同的方式做同样的事情时，我们这是在行业中制造混乱，我们使人们更难阅读他人的代码，等等。

&emsp;&emsp;&emsp;&emsp; Sometimes the benefit added by having two different textual representations for one operation (like query expressions versus their underlying method call form, or + versus String.Concat) is so huge that it’s worth the potential confusion. 

&emsp;&emsp;&emsp;&emsp; 有时，一个操作（例如查询表达式与它们的底层方法调用形式，或+与String.Concat）具有两种不同的文本表示，增加的好处是巨大的，以至于潜在的混淆是值得的。

&emsp;&emsp;&emsp;&emsp; But the compelling benefit of query expressions is their readability; this new form of “foreach” is certainly no more readable than the “normal” form and is arguably worse.

&emsp;&emsp;&emsp;&emsp; 但是查询表达式的引人注目的好处是它们的可读性; 这种新形式的“foreach”肯定不比“正常”形式更可读，并且可以说更糟。

&emsp;&emsp;&emsp;&emsp; If you don’t agree with these philosophical objections and find practical value in this pattern, by all means, go ahead and write this trivial one-liner yourself.

&emsp;&emsp;&emsp;&emsp; 如果你不同意这些哲学的反对意见，并在这种模式中找到实用的价值，无论如何,自己去写这个微不足道的一行程序。

&emsp;&emsp;&emsp;&emsp; UPDATE: [The method in question has been removed from the “Metro” version of the base class library.](https://social.msdn.microsoft.com/Forums/en-US/758f7b98-e3ce-41e5-82a2-109f1df446c2/where-is-listtforeach?forum=winappswithcsharp)

[The End](#maybe).

写在最后的话：
	通过翻译这篇文章，我深刻的意识到自己的不足，在英语方面，在计算机方面。尽管前路坎坷，我依然想去那里看看。
	大多数语句都是通过google、bing、youdao的翻译网站，对比、截取、润色而成。
	我没有经过授权，如果侵权联系[我](mailto:techrat@gmail.com)删掉。

[^404ed]: this page 404ed!