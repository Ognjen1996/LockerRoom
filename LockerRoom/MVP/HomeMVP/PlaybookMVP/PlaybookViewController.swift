
import UIKit

class PlaybookViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [PlaybookData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var presenter: PlaybookPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        presenter?.delegate = self
        presenter?.fetchData()
        // Do any additional setup after loading the view.
    }
    
}

extension PlaybookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stroyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = stroyboard.instantiateViewController(withIdentifier: "PlaybookDetailsViewController") as! PlaybookDetailsViewController
        vc.data = data[indexPath.row]
        show(vc, sender: self)
    }
}
extension PlaybookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PlaybookTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlaybookTableViewCell", for: indexPath) as! PlaybookTableViewCell
        cell.setup(with: data[indexPath.row], n: indexPath.row)
        return cell
    }
}
extension PlaybookViewController: PlaybookPresenterDelegate {
    func playbookPresenter(_ presenter: PlaybookPresenter, data: [PlaybookData]) {
        self.data = data
    }
}
