import Foundation
import SwiftData

@Model
class Skill {
    var name: String
    var progress: Double
    
    init(name: String, progress: Double) {
        self.name = name
        self.progress = progress
    }
}
