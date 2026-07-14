import SwiftUI
import SwiftData

@main
struct AnvilApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Skill.self)
    }
}
