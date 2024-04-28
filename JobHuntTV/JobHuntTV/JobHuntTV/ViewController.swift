import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let produktCategories_activeEjected: [String] = ["Active", "Ejected"]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        segmentedControl.removeAllSegments()
        for (index, category) in produktCategories_activeEjected.enumerated() {
            segmentedControl.insertSegment(withTitle: category, at: index, animated: false)
        }
        segmentedControl.selectedSegmentIndex = 0
    }


}

