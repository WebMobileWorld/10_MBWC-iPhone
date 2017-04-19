import UIKit

class MyColor: UIColor {
    class func mainColor() -> UIColor {
        return UIColor(red: 229.0/255.0, green: 134.0/255.0, blue: 10.0/255.0, alpha: 1.0)
    }
    
    class func lightColor() -> UIColor {
        return UIColor(red: 253.0/255.0, green: 177.0/255.0, blue: 20.0/255.0, alpha: 1.0)
    }
    
    class func mainBorderColor() -> UIColor {
        return UIColor(red: 234.0/255.0, green: 136.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    }
    
    class func borderColor() -> UIColor {
        return UIColor(red: 51.0/255.0, green: 64.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    }
}
