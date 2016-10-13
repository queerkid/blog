% Csharp and Haskell differences

> 最讨厌翻译的不好还满是错别字的书了。




1. repeat do something:

    on C#:
    
        Action pr_hw = () =>WriteLine("Hello World.");
        Enumerable.Range(0,10).ToList().ForEach(i=>pr_hw());

    on Haskell:

        let pr_hw = print "Hello World"
        replicateM_ 10 pr_hw


> 废话对我来来说就是：这很对，但我知道。