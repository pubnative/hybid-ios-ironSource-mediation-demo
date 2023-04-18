// For IronSource SDK Mediation Interstitial integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

#import "InterstitialViewController.h"
#import "IronSource/IronSource.h"

@interface InterstitialViewController () <LevelPlayInterstitialDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *showAdButton;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"IronSource Mediation Interstitial";
}

- (IBAction)loadAdTouchUpInside:(id)sender {
    [self.activityIndicator startAnimating];
    self.showAdButton.hidden = YES;
    [IronSource setLevelPlayInterstitialDelegate:self];
    [IronSource loadInterstitial];
}

- (IBAction)showAdTouchUpInside:(UIButton *)sender {
    if ([IronSource hasInterstitial]) {
        [IronSource showInterstitialWithViewController:self];
    } else {
        NSLog(@"Ad wasn't ready");
    }
}

#pragma mark - LevelPlayInterstitialDelegate

- (void)didLoadWithAdInfo:(ISAdInfo *)adInfo {
    [self.activityIndicator stopAnimating];
    self.showAdButton.hidden = NO;
}

- (void)didFailToLoadWithError:(NSError *)error {
    [self.activityIndicator stopAnimating];
    NSLog(@"Failed to load interstitial ad with error: %@", [error localizedDescription]);
}

- (void)didFailToShowWithError:(NSError *)error andAdInfo:(ISAdInfo *)adInfo {
    NSLog(@"Failed to show interstitial ad with error: %@", [error localizedDescription]);
}

-(void)didClickWithAdInfo:(ISAdInfo *)adInfo {
    NSLog(@"didClickInterstitial");
}

- (void)didOpenWithAdInfo:(ISAdInfo *)adInfo {
    NSLog(@"interstitialDidOpen");
}

-(void)didCloseWithAdInfo:(ISAdInfo *)adInfo {
    self.showAdButton.hidden = YES;
    NSLog(@"interstitialDidClose");
}

- (void)didShowWithAdInfo:(ISAdInfo *)adInfo {
    NSLog(@"interstitialDidShow");
}

@end
