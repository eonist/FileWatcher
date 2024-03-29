[![Tests](https://github.com/eonist/FileWatcher/actions/workflows/Tests.yml/badge.svg)](https://github.com/eonist/FileWatcher/actions/workflows/Tests.yml)

## FileWatcher

> A simple file-watcher in Swift

![platform](https://img.shields.io/badge/Platform-macOS-blue.svg)
![Lang](https://img.shields.io/badge/Language-Swift%205.0-orange.svg)
[![codebeat badge](https://codebeat.co/badges/a3c16aee-139e-4729-9dde-47fff8989782)](https://codebeat.co/projects/github-com-eonist-filewatcher-master)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)
[![mit Status](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)

### Installation:
- CocoaPods `pod "FileWatcher"`
- Carthage `github "eonist/FileWatcher" "master"`
- Swift Package Manager `https://github.com/eonist/FileWatcher.git`
- Manual Open `FileWatcherExample.xcodeproj`

### Example
This will monitor your Desktop for any file changes:

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
