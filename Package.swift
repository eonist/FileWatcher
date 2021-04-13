// swift-tools-version:5.2
import PackageDescription
let package = Package(
    name: "FileWatcher",
    products: [
        .library(
            name: "FileWatcher",
            targets: ["FileWatcher"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FileWatcher",
            dependencies: []),
        .testTarget(
            name: "FileWatcherTests",
            dependencies: ["FileWatcher"])
    ]
)
