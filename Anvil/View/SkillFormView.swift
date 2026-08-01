import SwiftUI
import SwiftData

struct SkillFormView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    private let skillToEdit: Skill?

    @State private var name: String
    @State private var skillDescription: String
    @State private var domain: SkillDomain
    @State private var progress: Double

    init(skillToEdit: Skill? = nil) {
        self.skillToEdit = skillToEdit
        _name = State(initialValue: skillToEdit?.name ?? "")
        _skillDescription = State(initialValue: skillToEdit?.skillDescription ?? "")
        _domain = State(initialValue: skillToEdit?.domain ?? .other)
        _progress = State(initialValue: skillToEdit?.progress ?? 0.0)
    }

    private var isNameValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private var isEditing: Bool {
        skillToEdit != nil
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Skill") {
                    TextField("Name", text: $name)
                    TextField("Description", text: $skillDescription, axis: .vertical)
                }

                Section("Domain") {
                    Picker("Domain", selection: $domain) {
                        ForEach(SkillDomain.allCases, id: \.self) { option in
                            Text(option.displayName).tag(option)
                        }
                    }
                }

                if !isEditing {
                    Section("Starting progress") {
                        Slider(value: $progress, in: 0...1, step: 0.05)
                        Text("\(Int(progress * 100))%")
                    }
                }
            }
            .navigationTitle(isEditing ? "Edit Skill" : "New Skill")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveSkill()
                        dismiss()
                    }
                    .disabled(!isNameValid)
                }
            }
        }
    }

    private func saveSkill() {
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        if let skillToEdit {
            skillToEdit.name = trimmedName
            skillToEdit.skillDescription = skillDescription
            skillToEdit.domain = domain
        } else {
            let skill = Skill(
                name: trimmedName,
                skillDescription: skillDescription,
                domain: domain,
                progress: progress
            )
            modelContext.insert(skill)
        }
    }
}

#Preview("Add") {
    SkillFormView()
        .modelContainer(for: Skill.self, inMemory: true)
}

#Preview("Edit") {
    SkillFormView(skillToEdit: Skill(name: "Swift", progress: 0.4))
        .modelContainer(for: Skill.self, inMemory: true)
}
