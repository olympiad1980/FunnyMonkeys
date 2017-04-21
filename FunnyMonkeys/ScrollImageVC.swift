
import UIKit

class ScrollImageVC: UIViewController {
    
    var profilesProp: Profile?
    
    static let segueIdentifier = "goToProfileImage"
    
    @IBOutlet weak var scrollViewForImage: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pageController: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let profileName = profilesProp {
            nameLabel.text = profileName.name
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollViewForImage.delegate = self
        
        initScrollImageProfile()
        initGestureRecognizer()
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func initScrollImageProfile() {
        
        if let property = profilesProp {
            let imageArray = property.image
            for item in 0..<imageArray.count {
                let imageView = UIImageView()
                let xProperty = scrollViewForImage.frame.width * CGFloat(item)
                imageView.frame = CGRect(x: xProperty, y: 0, width: scrollViewForImage.frame.width, height: scrollViewForImage.frame.height)
                imageView.image = UIImage(named: imageArray[item])
                imageView.clipsToBounds = true
                imageView.contentMode = .scaleAspectFill
                pageController.numberOfPages = imageArray.count
                scrollViewForImage.addSubview(imageView)
            }
            scrollViewForImage.isPagingEnabled = true
            scrollViewForImage.contentSize.width = scrollViewForImage.frame.width * CGFloat(imageArray.count)
        }
    }
    
    func initGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToNextVC(sender:)))
        view.endEditing(true)
        scrollViewForImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func goToNextVC(sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: ScrollImageVC.segueIdentifier, sender: nil)
    }
    
    func getCurrentImage() -> UIImage? {
        guard let profile = profilesProp else {
            return nil
        }
        let currentPage = Int(round(scrollViewForImage.contentOffset.x / scrollViewForImage.frame.size.width))
        let image = UIImage(named: profile.image[currentPage])
        return image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ScrollImageVC.segueIdentifier {
            if let nextVC = segue.destination as? ProfileImageVC {
                nextVC.imageProfile = getCurrentImage()
            }
        }
    }
}

extension ScrollImageVC: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollViewForImage.contentOffset.x / scrollViewForImage.frame.size.width)
        pageController.currentPage = Int(pageNumber)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollViewForImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}










