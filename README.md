![mit Status](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-macOS/iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%203.0.1-orange.svg)
[![codebeat badge](https://codebeat.co/badges/041905ca-d1a9-4090-81b1-564282200af4)](https://codebeat.co/projects/github-com-eonist-filewatcher-master)

## FileWatcher

A simple File watcher in swift.

Example (this will monitor your Desktop for any file changes): 

```swift
let filewatcher = FileWatcher([NSString(string: "~/Desktop").expandingTildeInPath])
    
filewatcher.callback = { event in
  print("Something happened here: " + event.path)
}
    
filewatcher.start() // start monitoring
```
### Running FileWatcher on a background thread

The above example will run FileWatcher (ie. its callback function) from the current thread. However, if your callback needs to run for any significatant amount of time (for example when monitoring a folder for photos and you need to run a lenghty image processing algorithm on them), this is rarely a good idea.

If you'd rather have your callback running on a background thread, you can provide your own queue, and FileWatcher will use that (instead of the default current thread / run loop):

```swift
filewatcher.queue = DispatchQueue.global()
```

### Notes and documentation:
[wiki](https://github.com/eonist/FileWatcher/wiki)  
Swift-Style-Guide: [raywenderlich](https://github.com/raywenderlich/swift-style-guide) 
