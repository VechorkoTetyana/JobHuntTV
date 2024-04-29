import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    let produktCategories_activeEjected: [String] = ["Active", "Ejected"]
    var categoryPointActive: [ProductViewModel_CompanyProposition] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPointActive = provideProducts()
        
        configureTableView()
        configuredSegmentedControl()
        }
    
    func configuredSegmentedControl() {
        segmentedControl.removeAllSegments()
        
        for (index, category) in produktCategories_activeEjected.enumerated() {
            segmentedControl.insertSegment(withTitle: category, at: index, animated: false)
        }
        
        segmentedControl.selectedSegmentIndex = 0
    }

    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    //tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")

    
    func provideProducts() -> [ProductViewModel_CompanyProposition] {
        // var debitProducts: [ProductViewModel_CompanyProposition] = []
        var categoryPointActive: [ProductViewModel_CompanyProposition] = []
        let activeCategory = "Active"
        
        categoryPointActive.append(ProductViewModel_CompanyProposition(
            title: "UX Research",
            description: "Google LLC",
            imageName: "Google",
            segmentName: "Full time, Senior Level, Distant",
            statusName: "Submitted, Test, Interview, Offer",
            active_ejected_Category: activeCategory))
        
        categoryPointActive.append(ProductViewModel_CompanyProposition(
            title: "Interaction Designer",
            description: "Microsoft Corporation",
            imageName: "Microsoft",
            segmentName: "Full time, Senior Level, Distant",
            statusName: "Submitted, Test, Interview, Offer",
            active_ejected_Category: activeCategory))
        
        categoryPointActive.append(ProductViewModel_CompanyProposition(
            title: "Product Designer",
            description: "Adobe Inc.",
            imageName: "Adobe",
            segmentName: "Full time, Senior Level, Distant",
            statusName: "Submitted, Test, Interview, Offer",
            active_ejected_Category: activeCategory))
        
        return categoryPointActive
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryPointActive.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell {
            
            let product = categoryPointActive[indexPath.row]
            
            cell.configure(viewModel: product)
           return cell
        }
        
        return UITableViewCell()
    }
}
