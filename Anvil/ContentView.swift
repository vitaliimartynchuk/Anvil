import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Skills", systemImage: "hammer.fill") {
                SkillsView()
            }
            Tab("Progress", systemImage: "chart.bar.fill") {
                ProgressTabView()
            }
            Tab("Settings", systemImage: "gearshape.fill") {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
