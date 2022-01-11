import Foundation

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
    }
    
    func interstitialDidOpen() {
        
    }
    
    func interstitialDidClose() {
        showAdButton.isHidden = true
    }
    
    func interstitialDidShow() {
    
    }
    
    func interstitialDidFailToShowWithError(_ error: Error!) {
    
    }
    
    func didClickInterstitial() {
        
    }
}
