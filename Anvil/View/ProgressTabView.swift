import SwiftUI

struct ProgressTabView: View {
    var body: some View {
        NavigationStack {
            Text("There will be progress here")
                .navigationTitle("Progress")
        }
    }
}

#Preview {
    ProgressTabView()
}
