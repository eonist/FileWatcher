![mit Status](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-macOS/iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%203.0.1-orange.svg)

## FileWatcher

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/FileWatcher.svg">

A simple File watcher in swift. Example code: 

```swift
let fileWatcher = FileWatcher(["~/Desktop/test/".tildePath])
        
fileWatcher!.event = { /*[weak self]*/ event in//<--The weak self part enables you to interact with your app in a safe manner, not required
    Swift.print(self?.someVariable)//Outputs: a variable in your current class
    Swift.print(event.description)//Outputs: a description of the file change
}
```
