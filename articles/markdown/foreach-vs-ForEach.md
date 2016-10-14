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
 
&emsp;&emsp;&emsp;&emsp; 我通常对“为什么某功能没实现？”的回应是：所有的功能都是未实现的，直到有人设计、实现、测试、说明、发布这个功能，以及还没有人花钱来做这些。

&emsp;&emsp;&emsp;&emsp; though I have famously pointed out that [even small features can have large costs](https://blogs.msdn.microsoft.com/ericlippert/2003/10/28/how-many-microsoft-employees-does-it-take-to-change-a-lightbulb/),this one really is dead easy,obviously correct,easy to test,and easy to documents.

&emsp;&emsp;&emsp;&emsp; 虽然我有公开地指出即使很小的功能也可以有巨大的成本，这真的容易透了，显而易见，容易测试，容易说明。

&emsp;&emsp;&emsp;&emsp; Costs is always a factor of course, but the costs for this one really are quite small.

&emsp;&emsp;&emsp;&emsp; 成本总是一个因素，但是这个功能的成本真的很小。



[to be continued](#maybe).



[^404ed]: this page 404ed!