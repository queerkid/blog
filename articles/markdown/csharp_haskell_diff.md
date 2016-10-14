% Csharp and Haskell differences

> 最讨厌翻译的不好还满是错别字的书了。




1. repeat do something:

&emsp;&emsp;&emsp;&emsp;on C#:
```
        Enumerable.Range(0,10).ToList().ForEach(i=>Console.WriteLine("Hello World."));
        //running on mono-csharp-shell
```
&emsp;&emsp;&emsp;&emsp;on Haskell:
```
        Control.Monad.replicateM_ 10 $ print "Hello World"
        -- running on ghci
```

> 废话对我来来说就是：这很对，但我知道。