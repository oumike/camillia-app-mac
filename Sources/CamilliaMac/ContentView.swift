import SwiftUI

struct ContentView: View {
    // Plain Binding instead of @State/@Bindable: those are macros whose plugins
    // ship only with full Xcode, and this package also builds with Command Line Tools.
    let model: GreeterModel

    private var name: Binding<String> {
        Binding(get: { model.name }, set: { model.name = $0 })
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Camillia")
                .font(.largeTitle.bold())
            Text("Linked \(model.info.name) v\(model.info.version)")
                .foregroundStyle(.secondary)

            HStack {
                TextField("Your name", text: name)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit(model.greet)
                Button("Greet", action: model.greet)
                    .keyboardShortcut(.defaultAction)
            }

            Text(model.result)
                .textSelection(.enabled)

            Spacer()
        }
        .padding(24)
    }
}
