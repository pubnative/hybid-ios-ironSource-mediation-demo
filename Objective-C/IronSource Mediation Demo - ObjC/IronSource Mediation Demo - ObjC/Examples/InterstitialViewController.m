// For IronSource SDK Mediation Interstitial integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

#import "InterstitialViewController.h"
#import "IronSource/IronSource.h"

@interface InterstitialViewController () <LPMInterstitialAdDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *showAdButton;
@property (nonatomic, strong) LPMInterstitialAd *interstitialAd;

@end

@implementation InterstitialViewController

static NSString *const kAdUnitId = @"4a0n1i4je40eigxl";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"IronSource Mediation Interstitial";
    self.interstitialAd = [[LPMInterstitialAd alloc] initWithAdUnitId:kAdUnitId];
    [self.interstitialAd setDelegate:self];
}

- (IBAction)loadAdTouchUpInside:(id)sender {
    [self.activityIndicator startAnimating];
    self.showAdButton.hidden = YES;
    [self.interstitialAd loadAd];
}

- (IBAction)showAdTouchUpInside:(UIButton *)sender {
    if ([self.interstitialAd isAdReady]) {
        [self.interstitialAd showAdWithViewController:self placementName:NULL];
    } else {
        NSLog(@"Ad wasn't ready");
    }
}

#pragma mark - LPMInterstitialAdDelegate

- (void)didLoadAdWithAdInfo:(LPMAdInfo *)adInfo {
    [self.activityIndicator stopAnimating];
    self.showAdButton.hidden = NO;
}

- (void)didFailToLoadAdWithAdUnitId:(NSString *)adUnitId error:(NSError *)error {
    [self.activityIndicator stopAnimating];
    NSLog(@"Failed to load interstitial with error: %@", error.localizedDescription);
}

- (void)didChangeAdInfo:(LPMAdInfo *)adInfo {
    NSLog(@"interstitialDidChangeAdInfo");
}

- (void)didDisplayAdWithAdInfo:(LPMAdInfo *)adInfo {
    NSLog(@"interstitialDidDisplay");
}

- (void)didFailToDisplayAdWithAdInfo:(LPMAdInfo *)adInfo error:(NSError *)error {
    NSLog(@"Failed to display interstitial with error: %@", error.localizedDescription);
}

- (void)didClickAdWithAdInfo:(LPMAdInfo *)adInfo {
    NSLog(@"didClickInterstitial");
}

- (void)didCloseAdWithAdInfo:(LPMAdInfo *)adInfo {
    self.showAdButton.hidden = YES;
    NSLog(@"interstitialDidClose");
    [self.interstitialAd loadAd];
}

@end
