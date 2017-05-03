
import UIKit

@IBDesignable
class UISliderX: UISlider {
    
    @IBInspectable var changeImage: UIImage? {
        didSet {
            setThumbImage(changeImage, for: .normal)
        }
    }
    
    @IBInspectable var changeHighlightedImage: UIImage? {
        didSet {
            setThumbImage(changeHighlightedImage, for: .highlighted)
        }
    }
}
