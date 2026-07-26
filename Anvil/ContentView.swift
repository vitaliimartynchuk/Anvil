import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("", systemImage: "graduationcap.fill") {
                SkillsView()
            }
            Tab("", systemImage: "chart.bar.xaxis") {
                ProgressTabView()
            }
            Tab("", systemImage: "gearshape.fill") {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
