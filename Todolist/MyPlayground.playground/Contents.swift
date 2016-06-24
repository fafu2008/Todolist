//: Playground - noun: a place where people can play

import UIKit


var mylist = ["hello","Test","demo",5]

mylist[0] = "hello world"

print(mylist.count)

//print(mylist.append("xjq"))

//print(mylist)

mylist.insert("123", atIndex: 2)

for value in mylist{
    print(value)
}


var myHash:Dictionary<String,String> = ["Key1":"Value1","Key2":"Value2","Key3":"Value3"]

var myHash2 = [1:3,"4":5,6:"fds"]

myHash.updateValue("Value22", forKey: "Key2")

for value in myHash2.values{
    print(value)
}

for i in 0 ... 4{
    print("i:\(i)")
}





