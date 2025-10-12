import UIKit

final class MainTabBarViewController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarAppearance()
        setupViewControllers()
    }
    
    // MARK: - Private Methods
    
    private func setupTabBarAppearance() {
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .white
        tabBar.backgroundImage = UIImage()
                tabBar.shadowImage = UIImage()
                tabBar.isTranslucent = false
                
                tabBar.layer.borderWidth = 1.0 / UIScreen.main.scale
                tabBar.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.2).cgColor
                tabBar.clipsToBounds = true
    }
    
    private func setupViewControllers() {
        let trackersVC = TrackersViewController()
        let statisticsVC = StatisticsViewController()
        
        let trackersImage = UIImage(named: "trackersItem")?.withRenderingMode(.alwaysTemplate)
        let statisticsImage = UIImage(named: "rabbitItem")?.withRenderingMode(.alwaysTemplate)
        
        trackersVC.tabBarItem = UITabBarItem(
            title: "Трекеры",
            image: trackersImage,
            selectedImage: nil
        )
        
        statisticsVC.tabBarItem = UITabBarItem(
            title: "Статистика",
            image: statisticsImage,
            selectedImage: nil
        )
        
        let trackersNC = UINavigationController(rootViewController: trackersVC)
        let statisticsNC = UINavigationController(rootViewController: statisticsVC)
        
        viewControllers = [trackersNC, statisticsNC]
    }
}

