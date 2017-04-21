
import UIKit

class ImageCell: UICollectionViewCell {
    
    var profile: Profile? {
        didSet {
            setupIU()
        }
    }
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var counts: UILabel!
    @IBOutlet weak var iconsImage: UIImageView!
    
    func setupIU() {
        if let property = profile {
            photoImage.image = UIImage(named: property.image[0])
            iconsImage.image = UIImage(named: property.icons)
            counts.text = property.image.count.description
        }
    }
}
