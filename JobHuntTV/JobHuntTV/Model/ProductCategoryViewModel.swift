import Foundation
import UIKit

struct ProductCategorieViewModel {
    let title: String
    let products: [ProductViewModelCompanyProposition]
    
    init(title: String, products: [ProductViewModelCompanyProposition]) {
        self.title = title
        self.products = products
    }
}

