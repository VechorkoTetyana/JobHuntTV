import Foundation
import UIKit

struct ProductViewModelCompanyProposition: Codable {
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

extension ProductViewModelCompanyProposition {
    var categoryTitle: String {
        activeEjectedCategory.capitalized
    }
}
