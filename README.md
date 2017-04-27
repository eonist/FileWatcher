![mit Status](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-macOS/iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%203.0.1-orange.svg)
[![codebeat badge](https://codebeat.co/badges/041905ca-d1a9-4090-81b1-564282200af4)](https://codebeat.co/projects/github-com-eonist-filewatcher-master)

## FileWatcher

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/FileWatcher.svg">

A simple File watcher in swift. Example code: 

```swift
let fileWatcher = FileWatcher(["~/Desktop/test/".tildePath])
        
fileWatcher!.event = { /*[weak self]*/ event in//<--The weak self part enables you to interact with your app in a safe manner, not required
    Swift.print(self?.someVariable)//Outputs: a variable in your current class
    Swift.print(event.description)//Outputs: a description of the file change
}

filewatcher.start() // start monitoring
```
### Running FileWatcher on a background thread

The above example will run FileWatcher (ie. its callback function) from the current thread. However, if your callback needs to run for any significatant amount of time (for example when monitoring a folder for photos and you need to run a lenghty image processing algorithm on them), this is rarely a good idea.

If you'd rather have your callback running on a background thread, you can provide your own queue, and FileWatcher will use that (instead of the default current thread / run loop):

```swift
filewatcher.queue = DispatchQueue.global()
```

### Recent updates:
- FileWatcher can now be Locally scoped (courtesy of: [paperlib](https://github.com/paperlib) )
- Better syntax: (courtesy of: [paperlib](https://github.com/paperlib) )

### Future of filewatcher:
[wiki](https://github.com/eonist/FileWatcher/wiki) 
