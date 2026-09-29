import CamilliaCore
import Observation

@Observable
final class GreeterModel {
    var name = ""
    var result = ""

    let info = coreInfo()

    func greet() {
        do {
            result = try CamilliaCore.greet(name: name)
        } catch {
            result = "Error: \(error)"
        }
    }
}
