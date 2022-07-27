// For IronSource SDK Mediation Interstitial integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit

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
        IronSource.setInterstitialDelegate(self)
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

extension Interstitial: ISInterstitialDelegate {
    func interstitialDidLoad() {
        activityIndicator.stopAnimating()
        showAdButton.isHidden = false
    }
    
    func interstitialDidFailToLoadWithError(_ error: Error!) {
        activityIndicator.stopAnimating()
        print("Failed to load interstitial with error: \(error.localizedDescription)")
    }
    
    func interstitialDidFailToShowWithError(_ error: Error!) {
        print("Failed to show interstitial with error: \(error.localizedDescription)")
    }
    
    func didClickInterstitial() {
        print("didClickInterstitial")
    }
    
    func interstitialDidOpen() {
        print("interstitialDidOpen")
    }
    
    func interstitialDidClose() {
        showAdButton.isHidden = true
        print("interstitialDidClose")
    }
    
    func interstitialDidShow() {
        print("interstitialDidShow")
    }
    
}
