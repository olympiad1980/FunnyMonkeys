
import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet weak var scrollImageView: UIScrollView!
    
    var imageArray: [String]? {
        didSet {
            initScrollImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func initScrollImage() {
        let imageView = UIImageView()
        
        if let array = imageArray {
            for item in 0..<array.count {
                let xPosition = scrollImageView.frame.origin.x * CGFloat(item)
                imageView.frame = CGRect(x: xPosition, y: 0, width: scrollImageView.frame.width, height: scrollImageView.frame.height)
                imageView.contentMode = .scaleAspectFill
                imageView.image = UIImage(named: array[item])
                
                scrollImageView.contentSize.width = scrollImageView.frame.width * CGFloat(item + 1)
                scrollImageView.addSubview(imageView)
            }
        }
    }
}
