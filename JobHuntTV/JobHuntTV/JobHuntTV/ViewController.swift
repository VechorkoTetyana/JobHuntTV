import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let produktCategoriesActiveEjected: [String] = ["Active", "Ejected"]
    var categoryPointActive: [ProductViewModelCompanyProposition] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPointActive = provideProducts()
        
        configureTableView()
        configuredSegmentedControl()
        }
    
    func configuredSegmentedControl() {
        
        segmentedControl.removeAllSegments()
        
        for (index, category) in produktCategoriesActiveEjected.enumerated() {
            segmentedControl.insertSegment(withTitle: category, at: index, animated: false)
        }
        segmentedControl.selectedSegmentIndex = 0
    }

    func configureTableView() {
        tableView.separatorColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    func provideProducts() -> [ProductViewModelCompanyProposition] {

        var categoryPointActive: [ProductViewModelCompanyProposition] = []
        let activeCategory = "Active"
        
        categoryPointActive.append(ProductViewModelCompanyProposition(
            title: "UX Research",
            description: "Google LLC",
            imageName: "Google",
            activeEjectedCategory: activeCategory))
        
        categoryPointActive.append(ProductViewModelCompanyProposition(
            title: "Interaction Designer",
            description: "Microsoft Corporation",
            imageName: "Microsoft",
            activeEjectedCategory: activeCategory))
        
        categoryPointActive.append(ProductViewModelCompanyProposition(
            title: "Product Designer",
            description: "Adobe Inc.",
            imageName: "Adobe",
            activeEjectedCategory: activeCategory))
        
        return categoryPointActive
    }
}

extension ViewController: UITableViewDataSource {
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

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
