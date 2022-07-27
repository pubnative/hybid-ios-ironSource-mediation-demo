// For IronSource SDK Mediation Interstitial integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

#import "InterstitialViewController.h"
#import "IronSource/IronSource.h"

@interface InterstitialViewController () <ISInterstitialDelegate>

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
    [IronSource setInterstitialDelegate:self];
    [IronSource loadInterstitial];
}

- (IBAction)showAdTouchUpInside:(UIButton *)sender {
    if ([IronSource hasInterstitial]) {
        [IronSource showInterstitialWithViewController:self];
    } else {
        NSLog(@"Ad wasn't ready");
    }
}

#pragma mark - ISInterstitialDelegate

- (void)interstitialDidLoad {
    [self.activityIndicator stopAnimating];
    self.showAdButton.hidden = NO;
}

- (void)interstitialDidFailToLoadWithError:(NSError *)error {
    [self.activityIndicator stopAnimating];
    NSLog(@"Failed to load interstitial ad with error: %@", [error localizedDescription]);
}

- (void)interstitialDidFailToShowWithError:(NSError *)error {
    NSLog(@"Failed to show interstitial ad with error: %@", [error localizedDescription]);
}

- (void)didClickInterstitial {
    NSLog(@"didClickInterstitial");
}

- (void)interstitialDidOpen {
    NSLog(@"interstitialDidOpen");
}

-(void)interstitialDidClose {
    self.showAdButton.hidden = YES;
    NSLog(@"interstitialDidClose");
}

- (void)interstitialDidShow {
    NSLog(@"interstitialDidShow");
}

@end
