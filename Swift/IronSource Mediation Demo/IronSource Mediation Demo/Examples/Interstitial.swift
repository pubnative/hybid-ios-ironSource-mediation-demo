// For IronSource SDK Mediation Interstitial integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import IronSource

class Interstitial: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showAdButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "IronSource Mediation Interstitial"
    }
    
    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        showAdButton.isHidden = true
        IronSource.setLevelPlayInterstitialDelegate(self)
        IronSource.loadInterstitial()
    }
    
    @IBAction func showAdTouchUpInside(_ sender: UIButton) {
        if IronSource.hasInterstitial() {
            IronSource.showInterstitial(with: self)
        } else {
            print("Ad wasn't ready")
        }
    }
}

extension Interstitial: LevelPlayInterstitialDelegate {
    
    func didLoad(with adInfo: ISAdInfo!) {
        activityIndicator.stopAnimating()
        showAdButton.isHidden = false
    }
    
    func didFailToLoadWithError(_ error: Error!) {
        activityIndicator.stopAnimating()
        print("Failed to load interstitial with error: \(error.localizedDescription)")
    }
    
    func didFailToShowWithError(_ error: Error!, andAdInfo adInfo: ISAdInfo!) {
        print("Failed to show interstitial with error: \(error.localizedDescription)")
    }
    
    func didClick(with adInfo: ISAdInfo!) {
        print("didClickInterstitial")
    }
    
    func didOpen(with adInfo: ISAdInfo!) {
        print("interstitialDidOpen")
    }
    
    func didClose(with adInfo: ISAdInfo!) {
        showAdButton.isHidden = true
        print("interstitialDidClose")
    }
    
    func didShow(with adInfo: ISAdInfo!) {
        print("interstitialDidShow")
    }
    
}
