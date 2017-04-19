import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    // MARK: Properties

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var introView: UITextView!

    @IBOutlet weak var videoButton: UIButton?
    @IBOutlet weak var introButton: UIButton!

    var isObserving = false;
    
    class var expandedHeight: CGFloat { get { return 270 } }
    class var defaultHeight: CGFloat  { get { return 35  } }

    func checkHeight() {
    
        videoButton?.isHidden = (frame.size.height < ExerciseTableViewCell.expandedHeight)
        introButton?.isHidden = (frame.size.height < ExerciseTableViewCell.expandedHeight)
        videoView.isHidden = (frame.size.height < ExerciseTableViewCell.expandedHeight)
        //introView.isHidden = (frame.size.height < ExerciseTableViewCell.expandedHeight)
 
    }
    
    func watchFrameChanges() {
        if !isObserving {
            addObserver(self, forKeyPath: "frame", options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.initial], context: nil)
            isObserving = true;
        }
    }
    
    func ignoreFrameChanges() {
        if isObserving {
            removeObserver(self, forKeyPath: "frame")
            isObserving = false;
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "frame" {
            checkHeight()
        }
    }

    // MARK: Action
    
    @IBAction func videoButtonAction(_ sender: AnyObject) {
        videoButton?.setImage(UIImage(named: "movie-orange"), for: UIControlState.normal)
        introButton?.setImage(UIImage(named: "note-f-orange-"), for: UIControlState.normal)
        videoView.isHidden = false
        introView.isHidden = true
        //linkButton.isHidden = true
    }
    
    @IBAction func introButtonAction(_ sender: AnyObject) {
        videoButton?.setImage(UIImage(named: "movie-f-orange"), for: UIControlState.normal)
        introButton?.setImage(UIImage(named: "note-orange"), for: UIControlState.normal)
        videoView.isHidden = true
        introView.isHidden = false
        //linkButton.isHidden = false
        
        introView.text = "The exercise should be preformed with high-intensity in which you give all-out, one hundred percent effort trough quick, intense bursts of exercise, followed by short, sometimes active, recovery periods. This type of training gets and keeps your heart rate up and burns more fat in less time. Need more information? See our web page;"
    }
    
    @IBAction func linkAction(_ sender: Any) {
        guard let url = URL(string: "https://www.10minburningworkout.com")
            else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
