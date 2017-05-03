
import UIKit

class Profile {
    
    var name: String
    var image: [String]
    var icons: String
    
    init(name: String, image: [String], icons: String) {
        self.name = name
        self.image = image
        self.icons = icons
    }
    
    convenience init(name: String, image: [String]) {
        self.init(name: name, image: image, icons: "")
    }
}

class ProfileFactory {
    
    func createProfile() -> [Profile] {
        let icons = "Camera"
        
        let profileArray = [
            Profile(name: "Pongo", image: ["portreti-obezian-42", "portreti-obezian-2", "portreti-obezian-4", "portreti-obezian-11"], icons: icons),
            Profile(name: "Cercopithecus", image: ["portreti-obezian-44", "portreti-obezian-3", "portreti-obezian-10"], icons: icons),
            Profile(name: "Pan", image: ["portreti-obezian-15", "portreti-obezian-32", "portreti-obezian-34", "portreti-obezian-38"], icons: icons),
            Profile(name: "Cebus", image: ["portreti-obezian-40", "portreti-obezian-28"], icons: icons),
            Profile(name: "Hylobatidae", image: ["portreti-obezian-27", "portreti-obezian-21", "portreti-obezian-6"], icons: icons),
            Profile(name: "...", image: ["portreti-obezian-13", "portreti-obezian-5"], icons: icons),
            Profile(name: "Baboon", image: ["portreti-obezian-18", "portreti-obezian-20", "portreti-obezian-23", "portreti-obezian-30"], icons: icons),
            Profile(name: "Macaca", image: ["portreti-obezian-16", "portreti-obezian-7", "portreti-obezian-1"], icons: icons),
            Profile(name: "Cercopithecus sclateri", image: ["portreti-obezian-37", "portreti-obezian-12"], icons: icons),
            Profile(name: "Mandrillus sphinx", image: ["portreti-obezian-31", "portreti-obezian-36", "portreti-obezian-41"], icons: icons)
        ]
        
        return profileArray
    }
}
