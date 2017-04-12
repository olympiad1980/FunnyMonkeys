
import UIKit

class ImageCell: UICollectionViewCell {
    
    var setupImage: Profile? {
        didSet {
            setupIU()
        }
    }
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var counts: UILabel!
    @IBOutlet weak var iconsImage: UIImageView!
    
    func setupIU() {
        if let photo = setupImage, let count = setupImage, let icon = setupImage {
            photoImage.image = UIImage(named: photo.image[0])
            iconsImage.image = UIImage(named: icon.icons)
            counts.text = count.image.count.description
        }
    }
}
