// For IronSource SDK Mediation Rewarded integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import IronSource

class Rewarded: UIViewController {
    
    @IBOutlet weak var showAdButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "IronSource Mediation Rewarded"
        IronSource.setLevelPlayRewardedVideoDelegate(self)
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

extension Rewarded: LevelPlayRewardedVideoDelegate {
    
    func hasAvailableAd(with adInfo: ISAdInfo!) {
        showAdButton.isEnabled = true
        print("rewardedVideoHasChangedAvailability: true")
    }
    
    func hasNoAvailableAd() {
        showAdButton.isEnabled = false
        print("rewardedVideoHasChangedAvailability: false")
    }
    
    func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!, with adInfo: ISAdInfo!) {
        print("User did receive reward: \(String(describing: placementInfo.rewardName)) with amount: \(String(describing: placementInfo.rewardAmount))")
    }
    
    func didFailToShowWithError(_ error: Error!, andAdInfo adInfo: ISAdInfo!) {
        print("Failed to show rewarded ad with error: \(error.localizedDescription)")
    }
    
    func didOpen(with adInfo: ISAdInfo!) {
        print("rewardedVideoDidOpen")
    }
    
    func didClose(with adInfo: ISAdInfo!) {
        print("rewardedVideoDidClose")
    }
    
    func didClick(_ placementInfo: ISPlacementInfo!, with adInfo: ISAdInfo!) {
        print("didClickRewardedVideo")
    }
    
}
