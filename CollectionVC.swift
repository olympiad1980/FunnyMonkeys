
import UIKit

class CollectionVC: UIViewController {
    static var cellIdentifier = "ImageCell"
    static var segueIdentifier = "goToScrollImage"
    
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0)
    let itemsPerRows: CGFloat = 2
    
    var profile = ProfileFactory().createProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexPathForRow = profile[indexPath.row]
        performSegue(withIdentifier: CollectionVC.segueIdentifier, sender: indexPathForRow)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == CollectionVC.segueIdentifier {
            if let nextVC = segue.destination as? ScrollImageVC {
                nextVC.profileProp = sender as? Profile
            }
        }
    }
}

extension CollectionVC: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profile.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionVC.cellIdentifier, for: indexPath) as! ImageCell
        let profileIndexPath = profile[indexPath.row]
        cell.setupImage = profileIndexPath
        
        return cell
    }
}

extension CollectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRows + 1)
        let avaiLableWhith = view.frame.width - paddingSpace
        let whithPerItem = avaiLableWhith / itemsPerRows
        
        let sizeItem = CGSize(width: whithPerItem, height: whithPerItem)
        return sizeItem
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }

}







