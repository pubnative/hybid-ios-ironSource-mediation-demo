// For IronSource SDK Mediation Banner integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import IronSource

class Banner: UIViewController {
    
    @IBOutlet weak var bannerAdContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var bannerView: ISBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "IronSource Mediation Banner"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.destroyBanner()
    }
    
    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        bannerAdContainer.isHidden = true
        self.destroyBanner()
        IronSource.setLevelPlayBannerDelegate(self)
        IronSource.loadBanner(with: self, size: ISBannerSize(width: 320, andHeight: 50))
    }
    
    func destroyBanner() {
        if (bannerView != nil) {
            IronSource.destroyBanner(bannerView)
            bannerView = nil
        }
    }
}

extension Banner : LevelPlayBannerDelegate {
    
    func didLoad(_ bannerView: ISBannerView!, with adInfo: ISAdInfo!) {
        self.bannerView = bannerView
        self.bannerView.frame = CGRect(x: 0, y: 0, width: bannerAdContainer.frame.size.width, height: bannerAdContainer.frame.size.height)
        bannerAdContainer.isHidden = false
        activityIndicator.stopAnimating()
        bannerAdContainer.addSubview(self.bannerView)
    }
    
    func didFailToLoadWithError(_ error: Error!) {
        activityIndicator.stopAnimating()
        print("Failed to load banner with error: \(error.localizedDescription)")
    }
    
    func didClick(with adInfo: ISAdInfo!) {
        print("didClickBanner")
    }
    
    func didLeaveApplication(with adInfo: ISAdInfo!) {
        print("didLeaveApplication")
    }
    
    func didPresentScreen(with adInfo: ISAdInfo!) {
        print("didPresentScreen")
    }
    
    func didDismissScreen(with adInfo: ISAdInfo!) {
        print("didDismissScreen")
    }
}
