% 水仙花数

Haskell:
```
filter (\n->sum [ (digitToInt i)^3 | i<-show n] == n) [100..999]
```

Python:
```
[x for x in filter(lambda n:sum([int(i)**3 for i in str(n)]) == n,range(100,1000))]
```