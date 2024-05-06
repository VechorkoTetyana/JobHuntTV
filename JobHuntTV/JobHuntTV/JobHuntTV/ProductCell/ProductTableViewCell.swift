import Foundation
import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var DescriptionLbl: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(
        viewModel: ProductViewModelCompanyProposition
    ) {
        productImageView.image = UIImage(named: viewModel.imageName)
        TitleLbl.text = viewModel.title
        DescriptionLbl.text = viewModel.description
        
    }
}
