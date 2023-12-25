import UIKit

final class ViewController: UIViewController {
    // MARK: - private propertys
    private let titleLabel = UILabel()
    private let tableView = UITableView()

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstreints()
        setupUI()
        configTableView()
    }
    
    // MARK: - helpers methods
    
    // addsubview
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    // table view confug
    private func configTableView() {
        tableView.dataSource = self
        tableView.register(CastomTableViewCell.self, forCellReuseIdentifier: "CastomTableViewCell")
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
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastomTableViewCell", for: indexPath) as? CastomTableViewCell {
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}


