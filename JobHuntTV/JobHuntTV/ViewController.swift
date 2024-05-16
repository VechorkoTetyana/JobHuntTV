import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
//    let produktCategoriesActiveEjected: [String] = ["Active", "Ejected"]
    private var categories: [ProductCategorieViewModel] = []
    private var currentCategoryIndex: Int = 0
    
    private var currentCategory: ProductCategorieViewModel {
        categories[currentCategoryIndex]
    }
    
    private var loader = ProductsLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        categories = provideCategories()
        
        configureTableView()
        configuredSegmentedControl()
        }
    
    func configuredSegmentedControl() {
        
        segmentedControl.removeAllSegments()
        
        for (index, category) in categories.enumerated() {
            segmentedControl.insertSegment(
                withTitle: category.title,
                at: index,
                animated: false
            )
        }
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(onSegmentControlIndexChanged), for: .valueChanged)
    }
    @objc
    private func onSegmentControlIndexChanged() {
        currentCategoryIndex = segmentedControl.selectedSegmentIndex
        tableView.reloadData()
    }

    func configureTableView() {
        tableView.separatorColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    private func provideCategories() -> [ProductCategorieViewModel] {

        /*    var categoryPointActive: [ProductViewModelCompanyProposition] = []
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
            activeEjectedCategory: activeCategory))*/
        
        let products = loader.load()
        
        let produktCategories: [String] = ["Active", "Ejected"]
        
        var categories: [String: [ProductViewModelCompanyProposition]] = [:]
        
        for category in produktCategories {
            categories[category] = []
        }
        
        for product in products {
            categories[product.categoryTitle]?.append(product)
        }
/*
        var result = [ProductCategorieViewModel]()
        
        for (categoryKey, products) in categories {
            result.append(ProductCategorieViewModel(
                title: categoryKey,
                products: products
            ))
        }*/
        
        return produktCategories.compactMap {
            guard let products = categories[$0] else { return nil }
            return ProductCategorieViewModel(title: $0, products: products)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCategory.products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell {
            
            let products = currentCategory.products
            
            let product = products[indexPath.row]
            
            cell.configure(viewModel: product)
            
            cell.setFirstCellCornerRadius()

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
