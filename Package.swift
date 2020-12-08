// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "FileWatcher",
  platforms: [
    .macOS(.v10_12),
  ],
  products: [
    .library(
      name: "FileWatcher",
      targets: ["FileWatcher"]
    ),
  ],
  targets: [
    .target(
      name: "FileWatcher",
      dependencies: [],
      path: "./",
      exclude: ["FileWatcherExample", "FileWatcherExample.xcodeproj", "FileWatcher.podspec"]
    )
  ],
  swiftLanguageVersions: [.v4]
)
