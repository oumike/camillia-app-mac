import AppKit
import SwiftUI

@main
struct CamilliaApp: App {
    private let model = GreeterModel()

    init() {
        // Needed when launched via `swift run` rather than from a .app bundle,
        // otherwise the window never becomes key.
        NSApplication.shared.setActivationPolicy(.regular)
        NSApplication.shared.activate()
    }

    var body: some Scene {
        WindowGroup("Camillia") {
            ContentView(model: model)
                .frame(minWidth: 420, minHeight: 260)
        }
    }
}
