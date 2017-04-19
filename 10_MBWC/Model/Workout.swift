import Foundation

struct Workout {
    var workout_id: Int64?
    var workout_type: String
    var workout_order: Int64
    var workout_purchased: Bool
    var workout_title: String
    var workout_video_name: String
    var workout_video_extension: String
    var workout_voice_name: String
    var workout_voice_extension: String
    var workout_introduction: String
    var workout_done: Bool
    
    init() {
        self.workout_id = 0
        self.workout_type = ""
        self.workout_order = 0
        self.workout_purchased = false
        self.workout_title = ""
        self.workout_video_name = ""
        self.workout_video_extension = ""
        self.workout_voice_name = ""
        self.workout_voice_extension = ""
        self.workout_introduction = ""
        self.workout_done = false
    }
    
    init(workout_id: Int64) {
        self.workout_id = workout_id
        self.workout_type = ""
        self.workout_order = 0
        self.workout_purchased = false
        self.workout_title = ""
        self.workout_video_name = ""
        self.workout_video_extension = ""
        self.workout_voice_name = ""
        self.workout_voice_extension = ""
        self.workout_introduction = ""
        self.workout_done = false
    }
    
    init(_ workout_id: Int64,
         _ workout_type: String,
         _ workout_order: Int64,
         _ workout_purchased: Bool,
         _ workout_title: String,
         _ workout_video_name: String,
         _ workout_video_extension: String,
         _ workout_voice_name: String,
         _ workout_voice_extension: String,
         _ workout_introduction: String,
         _ workout_done: Bool) {
        self.workout_id = workout_id
        self.workout_type = workout_type
        self.workout_order = workout_order
        self.workout_purchased = workout_purchased
        self.workout_title = workout_title
        self.workout_video_name = workout_video_name
        self.workout_video_extension = workout_video_extension
        self.workout_voice_name = workout_voice_name
        self.workout_voice_extension = workout_voice_extension
        self.workout_introduction = workout_introduction
        self.workout_done = workout_done
    }
    
    mutating func setWorkoutDone(_ workout_done: Bool) {
        self.workout_done = workout_done
    }
}
