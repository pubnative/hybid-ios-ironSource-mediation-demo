// For IronSource SDK Mediation Rewarded integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit

class Rewarded: UIViewController {
    
    @IBOutlet weak var showAdButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "IronSource Mediation Rewarded"
        IronSource.setRewardedVideoDelegate(self)
        showAdButton.isEnabled = IronSource.hasRewardedVideo()
    }
    
    @IBAction func showAdTouchUpInside(_ sender: UIButton) {
        if IronSource.hasRewardedVideo() {
            IronSource.showRewardedVideo(with: self)
        } else {
            print("Ad wasn't ready")
        }
    }
}

extension Rewarded: ISRewardedVideoDelegate {
    func rewardedVideoHasChangedAvailability(_ available: Bool) {
        if available {
            showAdButton.isEnabled = true
            print("rewardedVideoHasChangedAvailability: true")
        } else {
            showAdButton.isEnabled = false
            print("rewardedVideoHasChangedAvailability: false")
        }
    }
    
    func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!) {
        print("User did receive reward: \(String(describing: placementInfo.rewardName)) with amount: \(String(describing: placementInfo.rewardAmount))")
    }
    
    func rewardedVideoDidFailToShowWithError(_ error: Error!) {
        print("Failed to show rewarded ad with error: \(error.localizedDescription)")
    }
    
    func rewardedVideoDidOpen() {
        print("rewardedVideoDidOpen")
    }
    
    func rewardedVideoDidClose() {
        print("rewardedVideoDidClose")
    }
    
    func rewardedVideoDidStart() {
        print("rewardedVideoDidStart")
    }
    
    func rewardedVideoDidEnd() {
        print("rewardedVideoDidEnd")
    }
    
    func didClickRewardedVideo(_ placementInfo: ISPlacementInfo!) {
        print("didClickRewardedVideo")
    }
    
}
