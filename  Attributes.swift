
import UIKit

class Attributes {
    
    let name: String
    let age: Int
    let description: String? = nil
    let kind: String
    
    init(name: String, age: Int, kind: String) {
        self.name = name
        self.age = age
        self.kind = kind
    }
}

