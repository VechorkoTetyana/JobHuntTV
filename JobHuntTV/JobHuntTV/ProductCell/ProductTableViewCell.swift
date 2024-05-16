import Foundation
import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var background: UIView!
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
    
    func setFirstCellCornerRadius() {
     
        background.layer.shadowColor = UIColor.black.cgColor
        background.layer.shadowOpacity = 0.1
        background.layer.shadowOffset = CGSize(width: 0, height: 2)
        background.layer.shadowRadius = 10

        background.layer.cornerRadius = 16
        
    }
}
