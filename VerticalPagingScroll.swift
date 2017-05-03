//ß

import UIKit

class VerticalPagingScroll: UIViewController {
    
    var profile = ProfileFactory().createProfile()
    private let heightLabel: CGFloat = 75
    private let heightScroll: CGFloat = 375
    
    private let buttonIn = UIImage(named: "Back_000000_100")
    private let buttonOff = UIImage(named: "In_000000_100")
    private let smileHappyUp = UIImage(named: "HappyUp")
    private let smileHappyDown = UIImage(named: "HappyDown")
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initScrollView(scroll: mainScrollView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let sizeHeightView = view.frame.size.height
        let sizeHeightScroll = initScrollViewWhithImage().frame.size.height
        mainScrollView.contentSize.height = calculationScrolling(h01: sizeHeightView, h02: sizeHeightScroll)
    }
    
    func initScrollView(scroll: UIScrollView) {
        
        scroll.frame.size = view.bounds.size
        scroll.backgroundColor = .green
        scroll.bounces = false
        
        scroll.addSubview(initScrollViewWhithImage())
        scroll.addSubview(dataScrollView())
        scroll.addSubview(initPlate())
        scroll.addSubview(initlabelForName())
        scroll.addSubview(smileButtonAction())
        scroll.addSubview(alertButtonAction())

    }
    
    func initScrollViewWhithImage() -> UIScrollView {
        
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: mainScrollView.frame.size.width, height: heightScroll)
        scrollView.isPagingEnabled = true
        
        for item in 0..<profile.count {
            let imageView = UIImageView()
            let xPosition = scrollView.frame.size.width * CGFloat(item)
            imageView.frame = CGRect(x: xPosition, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
            imageView.image = UIImage(named: profile[item].image[0])
            imageView.contentMode = .scaleAspectFill
            scrollView.addSubview(imageView)
        }

        scrollView.contentSize.width = scrollView.frame.size.width * CGFloat(profile.count)
        return scrollView
    }
    
    func dataScrollView() -> UIScrollView {
        let scroll = UIScrollView()
        let heightScroll = initScrollViewWhithImage().frame.size.height
        let mainSize = mainScrollView.bounds.size
        
        scroll.frame = CGRect(x: 0, y: heightScroll, width: mainSize.width, height: mainSize.height)
        scroll.contentSize.height = mainSize.height + heightScroll
        scroll.backgroundColor = UIColor.brown
        
        return scroll
    }
    
// MARK: плашка
    
    func initPlate() -> UIView {
        let plate = UIView()
        plate.frame = CGRect(x: 0, y: heightScroll, width: mainScrollView.frame.size.width, height: heightLabel)
        plate.backgroundColor = .red
        
        return plate
    }
    
    func initlabelForName() -> UILabel {
        let labelView = UILabel()
        labelView.frame = CGRect(x: 20, y: initPlate().frame.origin.y, width: 1200, height: 50)
        labelView.textColor = .white

        for item in 0..<profile.count {
            labelView.text = profile[item].name
        }
        
        return labelView
    }
    
    func initImageInPlane() -> UIImageView {
        let image = UIImageView()
        image.frame = CGRect(x: initPlate().center.x, y: initPlate().frame.origin.y + 20, width: 30, height: 30)
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "HappyUp")
        image.tintColor = UIColor.white
        
        return image
    }
    
// MARK: функция image Smile
    func smileButtonAction() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: initPlate().center.x, y: initPlate().frame.origin.y + 20, width: 30, height: 30)
        button.contentMode = .scaleAspectFill
        button.setImage(smileHappyUp, for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        
        return button
    }
    
// MARK: функция Alert
    func alertButtonAction() -> UIButton {
        let button = UIButton()
        let xPosition = (initPlate().frame.origin.x + initPlate().frame.origin.y) - 20
        
        button.setImage(buttonIn, for: .normal)
        button.frame = CGRect(x: xPosition, y: initPlate().frame.origin.y + 20, width: 30, height: 30)
        button.contentMode = .scaleAspectFill
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(buttonAlert), for: .touchUpInside)
        
        return button
    }
    
    func buttonAlert() {
        
        let alert = UIAlertController(title: "Message", message: "Monkey!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func buttonClicked(sender: UIButton) {
        
        if sender.currentImage ==  smileHappyUp {
            sender.setImage(smileHappyDown, for: .normal)
        }
            
        else {
            sender.setImage(smileHappyUp, for: .normal)
        }
    }
    
    func calculationScrolling(h01: CGFloat, h02: CGFloat) -> CGFloat {
        let resault = (h01 + h02)
        
        return resault
    }
}





