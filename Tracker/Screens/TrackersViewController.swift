import UIKit

final class TrackersViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private lazy var trackersLabel: UILabel = {
        let label = UILabel()
        label.text = "Трекеры"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var datePicker: UIDatePicker = {
            let picker = UIDatePicker()
            picker.datePickerMode = .date
            picker.locale = Locale(identifier: "ru_RU")
            picker.preferredDatePickerStyle = .automatic
        picker.backgroundColor = .clear
        picker.translatesAutoresizingMaskIntoConstraints = false
            
            return picker
        }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar ()
        searchBar.placeholder = "Поиск"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.backgroundColor = UIColor(red: 0.46, green: 0.46, blue: 0.50, alpha: 0.12)
        
        searchBar.layer.cornerRadius = 8
        searchBar.clipsToBounds = true
        
        let searchTextField = searchBar.searchTextField
        searchTextField.backgroundColor = UIColor(red: 0.46, green: 0.46, blue: 0.50, alpha: 0.12)
        
        return searchBar
    }()
    
    private lazy var placeholderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Что будем отслеживать?"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .yBlackDay
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var placeholderStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [placeholderImageView, placeholderLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }
    
    // MARK: - Private Methodы
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(trackersLabel)
        view.addSubview(searchBar)
        view.addSubview(placeholderStack)
        
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        
        let addButton = UIBarButtonItem(
            image: UIImage(named: "plus"),
            primaryAction: UIAction { [weak self] _ in
                self?.addTrackerTapped()
            }
        )
        addButton.tintColor = UIColor.black
        
        let datePickerItem = UIBarButtonItem(customView: datePicker)
        
        navigationItem.leftBarButtonItem = addButton
        navigationItem.rightBarButtonItem = datePickerItem
        
        navigationItem.title = ""
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            datePicker.widthAnchor.constraint(equalToConstant: 120),
            datePicker.heightAnchor.constraint(equalToConstant: 34),
            
            trackersLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            trackersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBar.topAnchor.constraint(equalTo: trackersLabel.bottomAnchor, constant: 7),
            searchBar.heightAnchor.constraint(equalToConstant: 36),
            
            placeholderStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeholderStack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            placeholderImageView.widthAnchor.constraint(equalToConstant: 80),
            placeholderImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func addTrackerTapped() {
        print("Добавить трекер")
        // Логика перехода на экран создания трекера
    }
    
}
