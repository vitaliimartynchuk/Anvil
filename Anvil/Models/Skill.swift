import Foundation
import SwiftUI
import SwiftData

enum SkillDomain: String, Codable, CaseIterable {
    case work
    case personal
    case living
    case other

    var displayName: String {
        switch self {
        case .work: return "Work"
        case .personal: return "Personal"
        case .living: return "Living"
        case .other: return "Other"
        }
    }

    var color: Color {
        switch self {
        case .work: return .blue
        case .personal: return .purple
        case .living: return .green
        case .other: return .gray
        }
    }
}

@Model
class Skill {
    var name: String
    var skillDescription: String
    var domain: SkillDomain
    var progress: Double
    var dateCreated: Date

    init(
        name: String,
        skillDescription: String = "",
        domain: SkillDomain = .other,
        progress: Double = 0.0,
        dateCreated: Date = .now
    ) {
        self.name = name
        self.skillDescription = skillDescription
        self.domain = domain
        self.progress = progress
        self.dateCreated = dateCreated
    }
}
