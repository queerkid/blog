% The differences between programming languages.

> 最讨厌翻译的不好还满是错别字的书了。




1. repeat do something:

&emsp;&emsp;&emsp;&emsp;on Haskell:
```
        --running on ghci
        import Control.Monad
        replicateM_ 10 $ putStrLn "Hello World."
        
```

&emsp;&emsp;&emsp;&emsp;on C#:
```
        //running on mono-csharp-shell
        Enumerable.Range(0,10).ToList().ForEach(i=>Console.WriteLine("Hello World."));
        
```

2. get max odd number in seq:

&emsp;&emsp;&emsp;&emsp;on C#:
```
        //running on mono-csharp-shell
        Func<IEnumerable<int>,int> maxodd = nums => nums.Where(n=>n % 2 == 1).Max();
        
```

&emsp;&emsp;&emsp;&emsp;on Haskell:
```
        import Control.Monad -- just for syntax highlighting.
        --running on ghci
        let maxodd nums = maximum $ filter odd nums
        
```
&emsp;&emsp;&emsp;&emsp;on Python:
```
        #running on idle
        maxodd = lambda nums : max(filter((lambda x : x % 2),nums))
        #^_^，I learn python for many years.
        
```

> 废话对我来说就是：这很对，但我知道。