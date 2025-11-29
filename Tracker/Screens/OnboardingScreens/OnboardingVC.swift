import UIKit

final class OnboardingVC: UIViewController {
    
    // MARK: - Properties
    private let pageModel: OnboardingPage
    
    // MARK: - UI Elements
    
    private lazy var backImageView: UIImageView = {
        let imageView = UIImageView(image: pageModel.image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var onboardingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .yBlackDay
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.text = pageModel.text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var technologyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yBlackDay
        button.layer.cornerRadius = 16
        button.setTitle("Вот это технологии!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(technologyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Callback
    var onTechnologyButtonTapped: (() -> Void)?
    
    // MARK: - Initialization
    init(pageModel: OnboardingPage) {
        self.pageModel = pageModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        backImageView.frame = view.bounds
        view.addSubview(backImageView)
        view.addSubview(onboardingLabel)
        view.addSubview(technologyButton)
        
        NSLayoutConstraint.activate([
            onboardingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            onboardingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            onboardingLabel.bottomAnchor.constraint(equalTo: technologyButton.topAnchor, constant: -160),
            
            technologyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            technologyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            technologyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            technologyButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 60)
        ])
    }
    
    // MARK: - Actions
    @objc private func technologyButtonTapped() {
        onTechnologyButtonTapped?()
    }
}
