// swift-tools-version: 5.10
import PackageDescription

// Generated/ is produced by scripts/build-core.sh from the core submodule.
let generated = Context.packageDirectory + "/Generated"

let package = Package(
    name: "CamilliaMac",
    platforms: [.macOS(.v14)],
    targets: [
        .systemLibrary(
            name: "camillia_coreFFI",
            path: "Generated/include"
        ),
        .target(
            name: "CamilliaCore",
            dependencies: ["camillia_coreFFI"],
            path: "Generated/swift",
            linkerSettings: [
                .unsafeFlags(["-L", generated + "/lib"]),
                .linkedLibrary("camillia_core"),
            ]
        ),
        .executableTarget(
            name: "CamilliaMac",
            dependencies: ["CamilliaCore"],
            path: "Sources/CamilliaMac"
        ),
    ]
)
