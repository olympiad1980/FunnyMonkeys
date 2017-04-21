
import UIKit

class ProfileImageVC: UIViewController {
    
    var imageProfile: UIImage?
    @IBOutlet weak var fullImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = imageProfile {
            fullImageView.image = image
        }
    }
    
    @IBAction func backToVCButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
