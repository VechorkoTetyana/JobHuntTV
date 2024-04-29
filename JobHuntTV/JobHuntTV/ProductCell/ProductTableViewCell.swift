import Foundation
import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var DescriptionLbl: UILabel!
    
    @IBOutlet weak var StackViewParameters: UIStackView!
    @IBOutlet weak var StackViewParam_Time: UIView!
    @IBOutlet weak var StackViewPsrsm_ProfLevel: UIView!
    @IBOutlet weak var StackViewParam_Condition: UIView!
    
    
    @IBOutlet weak var StackView_Steps: UIStackView!
    @IBOutlet weak var StackView_StepSubmitted: UILabel!
    @IBOutlet weak var SubmittedThen: UIImageView!
    
    @IBOutlet weak var StackView_StepTest: UILabel!
    @IBOutlet weak var TestThen: UIImageView!
    
    @IBOutlet weak var StackView_StepInterview: UILabel!
    @IBOutlet weak var InterviewThen: UIImageView!
    
    @IBOutlet weak var StackView_StepOffer: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(
        viewModel: ProductViewModel_CompanyProposition
    ) {
        productImageView.image = UIImage(named: viewModel.imageName)
        TitleLbl.text = viewModel.title
        DescriptionLbl.text = viewModel.description
        
        let segmentNameLabel = UILabel()
            segmentNameLabel.text = viewModel.segmentName
        
        // Устанавливаем другие свойства UILabel, такие как цвет текста, шрифт, выравнивание и т. д.
//            segmentNameLabel.textColor = .black
//            segmentNameLabel.font = UIFont.systemFont(ofSize: 14)
            // Добавляем UILabel в StackViewParameters
        
            StackViewParameters.addArrangedSubview(segmentNameLabel)
        
        
        // Создание и настройка UILabel для отображения текста внутри StackView_Steps
            let statusNameLabel = UILabel()
            statusNameLabel.text = viewModel.statusName
            // Устанавливаем другие свойства UILabel, такие как цвет текста, шрифт, выравнивание и т. д.
//            statusNameLabel.textColor = .black
//            statusNameLabel.font = UIFont.systemFont(ofSize: 14)
            // Добавляем UILabel в StackView_Steps
        
            StackView_Steps.addArrangedSubview(statusNameLabel)
        
        
//        StackViewParameters.descriptionLbl.text = viewModel.segmentName
        
//        StackView_Steps.text = viewModel.statusName
    }
    
//    override class func awakeFromNib() {}
}
