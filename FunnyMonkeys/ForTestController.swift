
import UIKit

class ForTestController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var menuRoundVire: UIviewX!
    @IBOutlet weak var menuView: UIView!
    var isHidding = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.clipsToBounds = true
    }
    
    @IBAction func pushButtonAction(_ sender: UIButton) {
        animationBarMenu(sender: sender, button: button, menu: menuRoundVire)
    }
    
    func animationBarMenu(sender: UIButton, button: UIButton, menu: UIviewX) {
        if (isHidding) {
            UIView.animate(withDuration: 1, animations: {
                self.menuRoundVire.transform = CGAffineTransform(scaleX: 10, y: 10)
                self.button.transform = CGAffineTransform(rotationAngle: self.rotationAngle(degree: 180))
            }) { (true) in
            }
        }
            
        else {
            UIView.animate(withDuration: 1, animations: {
                self.menuRoundVire.transform = CGAffineTransform.identity
                self.button.transform = CGAffineTransform.identity
            }) { (true) in
            }
        }
        
        isHidding = !isHidding
    }
    
    func rotationAngle(degree: Double) -> CGFloat {
        return CGFloat(degree * .pi / degree)
    }
}
