import UIKit

class SheduleScreen: UIViewController {

    // MARK: - Properties
    
    weak var delegate: ScheduleSelectionDelegate?
    var selectedDays: [Weekday] = []
    
    // MARK: - UI Elements
    
    private let nameScreen: UILabel = {
        let label = UILabel()
        label.text = "Расписание"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .yBlackDay
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private let weekdayTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "weekdayCell")
        tableView.layer.cornerRadius = 16
        tableView.backgroundColor = UIColor(red: 230/255, green: 232/255, blue: 235/255, alpha: 0.3)
        tableView.isScrollEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        
        view.addSubview(nameScreen)
        view.addSubview(weekdayTableView)
        
        weekdayTableView.delegate = self
        weekdayTableView.dataSource = self
        
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            nameScreen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}



extension SheduleScreen: UITableViewDelegate {
    
}



extension SheduleScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Weekday.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
