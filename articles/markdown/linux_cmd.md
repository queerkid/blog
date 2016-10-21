% logging linux command

1. regex find then remove
```
find path -regextype sed -regex "pattern" -exec rm -r "{}" \;    
#or
find path -regextype sed -regex "pattern" -delete
```
example:
```
sudo find /usr/ -regextype sed -regex ".*youdao.*" -exec rm -r "{}" \;
#我用它删了有道辞典，因为在ubuntu16.10上不能用。
#or
find . -regextype sed -regex "^$" -delete
#安啦，不会删掉任何文件的。
```