import UIKit

final class CastomTableViewCell: UITableViewCell {
    
    // MARK: - private propertys
    private let contenerView = UIView()
    private let currencyNameLabel = UILabel()
    private let currencyLabel = UILabel()

    // MARK: - life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstreints()
        setupUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
 
    // MARK: - helpers methods
    
    // configure table view cell
    func configure(_ coin: ModelCoin) {
        currencyNameLabel.text = coin.name
        currencyLabel.text = String(coin.volumeDayUsd)
    }
    
    // add subview
    private func addSubviews() {
        contentView.addSubview(contenerView)
        contenerView.addSubview(currencyNameLabel)
        contenerView.addSubview(currencyLabel)
    }
    
    // constreint
    private func setupConstreints() {
        contenerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contenerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            contenerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            contenerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            contenerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        currencyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currencyNameLabel.topAnchor.constraint(equalTo: contenerView.topAnchor, constant: 13),
            currencyNameLabel.bottomAnchor.constraint(equalTo: contenerView.bottomAnchor, constant: -13),
            currencyNameLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8)
        ])
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currencyLabel.topAnchor.constraint(equalTo: contenerView.topAnchor, constant: 13),
            currencyLabel.bottomAnchor.constraint(equalTo: contenerView.bottomAnchor, constant: -13),
            currencyLabel.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -8)
        ])
        
    }
    
    // UI
    private func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        contenerView.layer.cornerRadius = 10
        contenerView.backgroundColor = UIColor(red: 37/255, green: 35/255, blue: 51/255, alpha: 1.0)
        currencyLabel.textColor = .lightGray

    }
}
