import Foundation

struct Voice {
    var audio_name: String
    var audio_extension: String
    
    init() {
        self.audio_name = ""
        self.audio_extension = ""
    }
    
    init(_ audio_name: String,
         _ audio_extension: String) {
        self.audio_name = audio_name
        self.audio_extension = audio_extension
    }
}

struct VoiceSetting {
    var voice_on: Bool
    //var volume_size: Int
    
    init() {
        self.voice_on = true
        //self.volume_size = 100
    }

    mutating func setVoiceOn(voice_on: Bool) {
        self.voice_on = voice_on
    }
/*
    mutating func setVolumeSize(volume_size: Int) {
        self.volume_size = volume_size
    }
*/
}
