import Foundation

struct Challange {
    var workout_type: String
    var from: String
    
    init() {
        self.workout_type = ""
        self.from = ""
    }
    
    mutating func setWorkoutType(workout_type: String) {
        self.workout_type = workout_type
    }
    
    mutating func setFrom(from: String) {
        self.from = from
    }
}
