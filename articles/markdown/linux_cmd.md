% logging linux command

1. regex find then remove
```
find dir_name -regextype sed -regex "pattern" -exec rm -r "{}" \;     
```
example:
```
sudo find /usr/ -regextype sed -regex ".*youdao.*" -exec rm -r "{}" \;
#我用它删了有道辞典，因为在ubuntu16.10上不能用。
```