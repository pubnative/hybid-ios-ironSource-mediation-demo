// For IronSource SDK Mediation Interstitial integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import IronSource

class Interstitial: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showAdButton: UIButton!

    var interstitialAd: LPMInterstitialAd!
    let adUnitId = "55a6bp4ai1sjp24x"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "IronSource Mediation Interstitial"
        interstitialAd = LPMInterstitialAd(adUnitId: adUnitId)
        interstitialAd.setDelegate(self)
    }

    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        showAdButton.isHidden = true
        interstitialAd.loadAd()
    }

    @IBAction func showAdTouchUpInside(_ sender: UIButton) {
        if interstitialAd.isAdReady() {
            interstitialAd.showAd(viewController: self, placementName: nil)
        } else {
            print("Ad wasn't ready")
        }
    }
}

extension Interstitial: LPMInterstitialAdDelegate {

    func didLoadAd(with adInfo: LPMAdInfo) {
        activityIndicator.stopAnimating()
        showAdButton.isHidden = false
    }

    func didFailToLoadAd(withAdUnitId adUnitId: String, error: Error) {
        activityIndicator.stopAnimating()
        print("Failed to load interstitial with error: \(error.localizedDescription)")
    }

    func didChangeAdInfo(_ adInfo: LPMAdInfo) {
        print("interstitialDidChangeAdInfo")
    }

    func didDisplayAd(with adInfo: LPMAdInfo) {
        print("interstitialDidDisplay")
    }

    func didFailToDisplayAd(with adInfo: LPMAdInfo, error: Error) {
        print("Failed to display interstitial with error: \(error.localizedDescription)")
    }

    func didClickAd(with adInfo: LPMAdInfo) {
        print("didClickInterstitial")
    }

    func didCloseAd(with adInfo: LPMAdInfo) {
        showAdButton.isHidden = true
        print("interstitialDidClose")
    }

}
