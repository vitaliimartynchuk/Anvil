import SwiftUI
import SwiftData

struct SkillsView: View {
    @Query private var skills: [Skill]
    @Environment(\.modelContext) private var modelContext

    @State private var isAddingSkill = false
    @State private var skillToEdit: Skill?

    var body: some View {
        NavigationStack {
            List {
                ForEach(skills) { skill in
                    NavigationLink {
                        SkillDetailView(skill: skill)
                    } label: {
                        HStack(spacing: 8) {
                            Circle()
                                .fill(skill.domain.color)
                                .frame(width: 10, height: 10)

                            VStack(alignment: .leading) {
                                Text(skill.name)
                                    .font(.headline)
                                ProgressView(value: skill.progress)
                            }
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            modelContext.delete(skill)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }

                        Button {
                            skillToEdit = skill
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.orange)
                    }
                }
            }
            .navigationTitle("Skills")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddingSkill = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingSkill) {
                SkillFormView()
            }
            .sheet(item: $skillToEdit) { skill in
                SkillFormView(skillToEdit: skill)
            }
        }
    }
}

#Preview {
    SkillsView()
        .modelContainer(for: Skill.self, inMemory: true)
}
