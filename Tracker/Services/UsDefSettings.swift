import Foundation

final class UsDefSettings {
    
    static let shared = UsDefSettings()
    
    private init () {}
    
    private enum Keys {
        static let onboardingShown = "onboardingShown"
    }
    
    var onboardingShown: Bool {
        get {UserDefaults.standard.bool(forKey: Keys.onboardingShown)}
        set {UserDefaults.standard.set(newValue, forKey: Keys.onboardingShown)}
    }
}
