
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
}

class ProfileFactory {
    
    func createProfile() -> [Profile] {
        
        let profileArray = [
            Profile(name: "Lena", image: ["n01", "n02", "n03", "n02"], icons: "Camera"),
            Profile(name: "Olya", image: ["n03", "n04", "n05"], icons: "Camera"),
            Profile(name: "Sveta", image: ["n02", "n01", "n04"], icons: "Camera"),
            Profile(name: "Nina", image: ["n01", "n05"], icons: "Camera"),
            Profile(name: "Lesya", image: ["n05", "n014", "n03"], icons: "Camera"),
            Profile(name: "Katya", image: ["n01"], icons: "Camera"),
            Profile(name: "Natali", image: ["n04", "n01", "n05", "n01"], icons: "Camera"),
            Profile(name: "Olga", image: ["n01", "n05"], icons: "Camera"),
            Profile(name: "Lena", image: ["n01", "n02", "n01"], icons: "Camera")
        ]
        return profileArray
    }
}
