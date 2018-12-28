import Foundation
import UIKit

class TestAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = window ?? UIWindow()
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}
