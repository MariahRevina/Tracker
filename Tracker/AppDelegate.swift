import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // MARK: - Core Data Stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tracker")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                assertionFailure("Unresolved error \(error), \(error.userInfo)")
            } else {
                print("✅ Core Data store loaded successfully")
            }
        })
        return container
    }()
    
    // MARK: - Store Instances
    private lazy var trackerCategoryStore: TrackerCategoryStore = {
        TrackerCategoryStore(context: persistentContainer.viewContext)
    }()
    
    private lazy var trackerStore: TrackerStore = {
        TrackerStore(context: persistentContainer.viewContext, trackerCategoryStore: trackerCategoryStore)
    }()
    
    private lazy var trackerRecordStore: TrackerRecordStore = {
        TrackerRecordStore(context: persistentContainer.viewContext)
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Используем bounds экрана вместо пустого инициализатора
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white

        let tabBarController = MainTabBarViewController(
            trackerStore: trackerStore,
            trackerRecordStore: trackerRecordStore
        )
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                assertionFailure("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
