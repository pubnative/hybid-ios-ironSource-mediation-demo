// For IronSource SDK Mediation Rewarded integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import IronSource

class Rewarded: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showAdButton: UIButton!

    var rewardedAd: LPMRewardedAd!
    let adUnitId = "evit0dy92tb2hzq8"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "IronSource Mediation Rewarded"
        rewardedAd = LPMRewardedAd(adUnitId: adUnitId)
        rewardedAd.setDelegate(self)
    }

    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        showAdButton.isHidden = true
        rewardedAd.loadAd()
    }

    @IBAction func showAdTouchUpInside(_ sender: UIButton) {
        if rewardedAd.isAdReady() {
            rewardedAd.showAd(viewController: self, placementName: nil)
        } else {
            print("Ad wasn't ready")
        }
    }
}

extension Rewarded: LPMRewardedAdDelegate {

    func didLoadAd(with adInfo: LPMAdInfo) {
        activityIndicator.stopAnimating()
        showAdButton.isHidden = false
    }

    func didFailToLoadAd(withAdUnitId adUnitId: String, error: Error) {
        activityIndicator.stopAnimating()
        print("Failed to load rewarded ad with error: \(error.localizedDescription)")
    }

    func didChangeAdInfo(_ adInfo: LPMAdInfo) {
        print("rewardedDidChangeAdInfo")
    }

    func didDisplayAd(with adInfo: LPMAdInfo) {
        print("rewardedVideoDidDisplay")
    }

    func didFailToDisplayAd(with adInfo: LPMAdInfo, error: Error) {
        print("Failed to display rewarded ad with error: \(error.localizedDescription)")
    }

    func didClickAd(with adInfo: LPMAdInfo) {
        print("didClickRewardedVideo")
    }

    func didCloseAd(with adInfo: LPMAdInfo) {
        showAdButton.isHidden = true
        print("rewardedVideoDidClose")
    }

    func didRewardAd(with adInfo: LPMAdInfo, reward: LPMReward) {
        print("User did receive reward: \(reward.name) with amount: \(reward.amount)")
    }

}
