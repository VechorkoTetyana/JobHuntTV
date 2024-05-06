import Foundation
import UIKit

struct ProductViewModelCompanyProposition {
    let title: String
    let description: String
    let imageName: String
    let activeEjectedCategory: String
    
    init(title: String, description: String, imageName: String, activeEjectedCategory: String) {
        self.title = title
        self.description = description
        self.imageName = imageName
        self.activeEjectedCategory = activeEjectedCategory
    }
}
