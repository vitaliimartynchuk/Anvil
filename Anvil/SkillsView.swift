import SwiftUI
import SwiftData

struct SkillsView: View {
    @Query private var skills: [Skill]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            List(skills) { skill in
                NavigationLink {
                    Text("Skill detail: \(skill.name)")
                } label: {
                    VStack(alignment: .leading) {
                        Text(skill.name)
                            .font(.headline)
                        ProgressView(value: skill.progress)
                    }
                }
            }
            .navigationTitle("Skills")
            .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button {
                                    let skill = Skill(name: "New Skill", progress: 0.0)
                                    modelContext.insert(skill)
                                } label: {
                                    Image(systemName: "plus")
                                }
                            }
                        }
        }
    }
}

#Preview {
    SkillsView()
        .modelContainer(for: Skill.self, inMemory: true)
}
