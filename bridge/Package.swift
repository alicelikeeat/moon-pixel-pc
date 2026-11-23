// swift-tools-version:5.9
import PackageDescription

// The game's core (core/ios: the iOS repository, a submodule) as a C library for Unreal: MoonPixelBridge.dll.
let package = Package(
    name: "MoonPixelBridge",
    platforms: [.macOS(.v14)],
    products: [.library(name: "MoonPixelBridge", type: .dynamic, targets: ["MoonPixelBridge"])],
    dependencies: [.package(name: "MoonPixelCore", path: "../core/ios")],
    targets: [
        .target(name: "MoonPixelBridge", dependencies: [.product(name: "MoonPixelCore", package: "MoonPixelCore")], path: "Sources/MoonPixelBridge"),
        .testTarget(name: "MoonPixelBridgeTests", dependencies: ["MoonPixelBridge", .product(name: "MoonPixelCore", package: "MoonPixelCore")], path: "Tests/MoonPixelBridgeTests"),
    ]
)
