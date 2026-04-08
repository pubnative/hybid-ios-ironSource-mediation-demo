import UIKit
// Step 1: Import HyBid into your class
import HyBid
// Step 2: Import IronSource into your class
import IronSource

@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let appToken = "1e3772d975444b7c89b765b5527734d7"
    let appStoreID = "1530210244"
    let appKey = "8f8fae85"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
// Step 3: Setup & Initialize HyBid SDK
        HyBid.initWithAppToken(appToken, completion: nil)
// Step 4: Setup & Initialize IronSource SDK
        let requestBuilder = LPMInitRequestBuilder(appKey: appKey)
            .withUserId("a")
        let initRequest = requestBuilder.build()
        LevelPlay.initWith(initRequest) { config, error in
            if let error = error {
                print("LevelPlay init failed: \(error.localizedDescription)")
            } else {
                print("LevelPlay init succeeded")
            }
        }
        
 

// Step 5: Set COPPA (Optional)
        HyBid.setCoppa(false)
// Step 6: Set Test Mode (Optional)
        HyBid.setTestMode(true)
// Step 7: Set Location Tracking (Optional)
        HyBid.setLocationTracking(true)
// Step 8: Set Targeting (Optional)
        let targeting = HyBidTargetingModel()
        targeting.age = 28
        targeting.interests = ["music"]
        targeting.gender = "f"     // "f" for female, "m" for male
        HyBid.setTargeting(targeting)
// Step 9: Set HyBid log level (Optional)
        HyBidLogger.setLogLevel(HyBidLogLevelDebug)

        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

}
