import SwiftUI

struct SkillDetailView: View {
    let skill: Skill

    @State private var isEditing = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(skill.name)
                    .font(.largeTitle)
                    .bold()

                HStack(spacing: 6) {
                    Circle()
                        .fill(skill.domain.color)
                        .frame(width: 10, height: 10)
                    Text(skill.domain.displayName)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("Progress")
                        .font(.headline)
                    ProgressView(value: skill.progress)
                    Text("\(Int(skill.progress * 100))%")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("Description")
                        .font(.headline)
                    Text(skill.skillDescription.isEmpty ? "No description" : skill.skillDescription)
                        .foregroundStyle(skill.skillDescription.isEmpty ? .secondary : .primary)
                }
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    isEditing = true
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            SkillFormView(skillToEdit: skill)
        }
    }
}

#Preview {
    NavigationStack {
        SkillDetailView(skill: Skill(name: "Swift", skillDescription: "Learning SwiftUI and SwiftData", domain: .personal, progress: 0.4))
    }
}
