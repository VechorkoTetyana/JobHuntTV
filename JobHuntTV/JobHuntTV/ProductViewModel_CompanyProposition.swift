import Foundation
import UIKit

struct ProductViewModel_CompanyProposition {
    let title: String
    let description: String
    let imageName: String
    let segmentName: String
    let statusName: String
//    let category: String
    let active_ejected_Category: String
    
    init(title: String, description: String, imageName: String, segmentName: String, statusName: String, active_ejected_Category: String) {
        self.title = title
        self.description = description
        self.imageName = imageName
        self.segmentName = segmentName
        self.statusName = statusName
//      self.category = category
        self.active_ejected_Category = active_ejected_Category
    }
}
