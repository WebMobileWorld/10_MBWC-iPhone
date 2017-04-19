import Foundation

struct Video {
    var video_type: String
    var video_name: String
    var video_extension: String
    var voice_name: String
    var voice_extension: String
    var video_introduction: String
    
    init() {
        self.video_type = ""
        self.video_name = ""
        self.video_extension = ""
        self.voice_name = ""
        self.voice_extension = ""
        self.video_introduction = ""
    }
    
    init(_ video_type: String,
         _ video_name: String,
         _ video_extension: String,
         _ voice_name: String,
         _ voice_extension: String,
         _ video_introduction: String) {
        self.video_type = video_type
        self.video_name = video_name
        self.video_extension = video_extension
        self.voice_name = voice_name
        self.voice_extension = voice_extension
        self.video_introduction = video_introduction
    }
}
