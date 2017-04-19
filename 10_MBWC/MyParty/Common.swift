import Foundation

class Common {
    
    //--------------------------- Global variables -----------------------//
    // Models
    static var allVideos = [Video]()
    static var allVoices = [Voice]()
    static var allWorkouts = [Workout]()
    static var currentChallange = Challange()
    static var settingValue = VoiceSetting()
    
    //--------------------------- Global functions -----------------------//
    // Trim string
    class func trim(_ str: String) -> String {
        let trimmedStr = str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmedStr
    }
    
    // New line
    class func newLine() -> String {
        return "\r\n"
    }
    
    // check if current device is iPhone or iPad
    class func isPad() -> Bool {
        var isPad = false
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            isPad = true
        }
        return isPad
    }
}
