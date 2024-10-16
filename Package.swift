// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLibraryProject",

    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftLibraryProject",

            targets: [
                // "SwiftLibraryFirstSubB",
                // "SwiftLibraryFirstSubA",
                "SwiftLibraryFirst"
            ])

    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // .target(
        //     name: "hw2spm",
        //     dependencies: [],

        //     linkerSettings: [
        //         .linkedFramework("hw2spm.framework")

        //     ]
        // ),

        .binaryTarget(
            name: "MyBinary",
            path:
                "xcframeworkfiles/Hw2SpmXCFramework.xcframework"

        ),
        .binaryTarget(
            name: "MyBinarySwift",
            path:
                "xcframeworkfiles/Hw2SpmSwiftXCFramework.xcframework"

        ),
        .target(
            name: "MyBinaryClient",
            dependencies: [
                "MyBinary",
               
            ],
            path: "Sources/XCPackage"

        ),
        .target(
            name: "SwiftLibraryFirstSubOC",
            dependencies: [
                "MyBinary",
            
            ],
            path: "Sources/LibrarySubOC",
            publicHeadersPath: "../LibrarySubOC/header"

        ),
        .target(
            name: "SwiftLibraryFirstSubB",
            path: "Sources/LibrarySubB"
        ),
        .target(
            name: "SwiftLibraryFirstSubA",
            path: "Sources/LibrarySubA"
        ),

        .target(
            name: "SwiftLibraryFirst",
            //path: "Sources/LibrarySubA"
            dependencies: [

                "SwiftLibraryFirstSubB",
                "SwiftLibraryFirstSubA",
                "SwiftLibraryFirstSubOC",
                "MyBinarySwift",
            ],
            path: "Sources/ZZPackage",
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedLibrary("SystemConfiguration"),
            ]
        ),
        // .testTarget(
        //     name: "swift-library-projectTests",
        //     dependencies: ["swift-library-project"]
        // ),
    ]
)
