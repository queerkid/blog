% Csharp and Haskell differences

> 最讨厌翻译的不好还满是错别字的书了。




1. repeat do something:

&emsp;&emsp;&emsp;&emsp;on C#:
```
        Action pr_hw = () =>WriteLine("Hello World.");
        Enumerable.Range(0,10).ToList().ForEach(i=>pr_hw());
```
&emsp;&emsp;&emsp;&emsp;on Haskell:
```
        let pr_hw = print "Hello World"
        replicateM_ 10 pr_hw
        -- or
        let rep10pr_hw = replicateM_ 10 $ print "Hello World"
```

> 废话对我来来说就是：这很对，但我知道。