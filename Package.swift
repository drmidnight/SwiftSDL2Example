// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSDL2Example",
    dependencies: [
        .package(url: "https://github.com/drmidnight/SwiftSDL2.git", from: "0.0.16"),
    ],
    targets: [
        .target(
            name: "SwiftSDL2Example",
            dependencies: ["SwiftSDL2"],
            linkerSettings: [
                .unsafeFlags(["-L", "/usr/local/Cellar/sdl2/2.0.12_1/lib/"], .when(platforms: [.macOS])),
                .unsafeFlags(["-L", "/usr/local/Cellar/sdl2_image/2.0.5/lib/"], .when(platforms: [.macOS])),
                .unsafeFlags(["-L", "/usr/local/Cellar/sdl2_ttf/2.0.15/lib/"], .when(platforms: [.macOS])),
            ]
        )
    ]
    
)
