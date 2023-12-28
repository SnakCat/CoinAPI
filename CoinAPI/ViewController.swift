import UIKit

final class ViewController: UIViewController {
    
    // MARK: - private propertys
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    private var coinJSON: [ModelCoin] = []

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstreints()
        setupUI()
        configTableView()
        requestCion()
    }
    
    // MARK: - helpers methods
    
    // requests
    private func requestCion() {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        NetworkManager.instance.getAssets { result in
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            switch result {
            case .success(let coin):
                DispatchQueue.main.async {
                    self.coinJSON = coin
                    self.tableView.reloadData()
                }
            case .failure:
                let alert = UIAlertController(title: "Error", message: "Ошибка запроса", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    // addsubview
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    // table view config
    private func configTableView() {
        tableView.dataSource = self
        tableView.register(CastomTableViewCell.self, forCellReuseIdentifier: "CastomTableViewCell")
        tableView.separatorStyle = .none
    }
    
    // constreints
    private func setupConstreints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // UI
    private func setupUI() {
        titleLabel.text = "Exhange Rates"
        titleLabel.font = .boldSystemFont(ofSize: 30)
        tableView.backgroundColor = .clear
        view.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
    }
}
// MARK: - extension

// table view
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coinJSON.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastomTableViewCell", for: indexPath) as? CastomTableViewCell {
            let tmpCoin = coinJSON[indexPath.row]
            cell.configure(tmpCoin)
            return cell
        }
        return UITableViewCell()
    }
}


