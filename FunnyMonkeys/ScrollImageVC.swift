
import UIKit

class ScrollImageVC: UIViewController {
    
    var profileProp: Profile?
    
    static let segueIdentifier = "goToProfileImage"
    @IBOutlet weak var scrollViewForImage: UIScrollView!
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uiButton = UIButton()
        uiButton.frame.size = scrollViewForImage.frame.size
        uiButton.backgroundColor = .black
        uiButton.addTarget(self, action: #selector(segueButtonAction), for: UIControlEvents.touchUpInside)
        scrollViewForImage.addSubview(uiButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initScrollImageProfile()
    }

    func segueButtonAction(sender: UIButton) {
        
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func initScrollImageProfile() {
        
        if let property = profileProp {
            let imageArray = property.image
            for item in 0..<imageArray.count {
                let xProperty = view.frame.width * CGFloat(item)
                imageView.frame = CGRect(x: xProperty, y: 0, width: scrollViewForImage.frame.width, height: scrollViewForImage.frame.height)
                imageView.image = UIImage(named: imageArray[item])
                imageView.clipsToBounds = true
                imageView.contentMode = .scaleAspectFill
                
                scrollViewForImage.isPagingEnabled = true
                scrollViewForImage.contentSize.width = scrollViewForImage.frame.width * CGFloat(item + 1)
                scrollViewForImage.addSubview(imageView)
            }
        }
    }
}








