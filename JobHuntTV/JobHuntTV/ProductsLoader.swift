import Foundation
import UIKit

class ProductsLoader {
    func load() -> [ProductViewModelCompanyProposition] {
        guard
            let path = Bundle.main.path(forResource: "products", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
            let products = try? JSONDecoder().decode([ProductViewModelCompanyProposition].self, from: data)
        else { return [] }
            
        return products
    }
}
