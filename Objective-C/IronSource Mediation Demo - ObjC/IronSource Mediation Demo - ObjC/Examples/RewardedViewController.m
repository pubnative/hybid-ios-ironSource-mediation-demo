// For IronSource SDK Mediation Rewarded integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

#import "RewardedViewController.h"
#import "IronSource/IronSource.h"

@interface RewardedViewController () <LPMRewardedAdDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *showAdButton;
@property (nonatomic, strong) LPMRewardedAd *rewardedAd;

@end

@implementation RewardedViewController

static NSString *const kAdUnitId = @"3vungq1070mrm73e";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"IronSource Mediation Rewarded";
    self.rewardedAd = [[LPMRewardedAd alloc] initWithAdUnitId:kAdUnitId];
    [self.rewardedAd setDelegate:self];
}

- (IBAction)loadAdTouchUpInside:(id)sender {
    [self.activityIndicator startAnimating];
    self.showAdButton.hidden = YES;
    [self.rewardedAd loadAd];
}

- (IBAction)showAdTouchUpInside:(UIButton *)sender {
    if ([self.rewardedAd isAdReady]) {
        [self.rewardedAd showAdWithViewController:self placementName:NULL];
    } else {
        NSLog(@"Ad wasn't ready");
    }
}

#pragma mark - LPMRewardedAdDelegate

- (void)didLoadAdWithAdInfo:(LPMAdInfo *)adInfo {
    [self.activityIndicator stopAnimating];
    self.showAdButton.hidden = NO;
}

- (void)didFailToLoadAdWithAdUnitId:(NSString *)adUnitId error:(NSError *)error {
    [self.activityIndicator stopAnimating];
    NSLog(@"Failed to load rewarded ad with error: %@", error.localizedDescription);
}

- (void)didChangeAdInfo:(LPMAdInfo *)adInfo {
    NSLog(@"rewardedDidChangeAdInfo");
}

- (void)didDisplayAdWithAdInfo:(LPMAdInfo *)adInfo {
    NSLog(@"rewardedVideoDidDisplay");
}

- (void)didFailToDisplayAdWithAdInfo:(LPMAdInfo *)adInfo error:(NSError *)error {
    NSLog(@"Failed to display rewarded ad with error: %@", error.localizedDescription);
}

- (void)didClickAdWithAdInfo:(LPMAdInfo *)adInfo {
    NSLog(@"didClickRewardedVideo");
}

- (void)didCloseAdWithAdInfo:(LPMAdInfo *)adInfo {
    self.showAdButton.hidden = YES;
    NSLog(@"rewardedVideoDidClose");
    [self.rewardedAd loadAd];
}

- (void)didRewardAdWithAdInfo:(LPMAdInfo *)adInfo reward:(LPMReward *)reward {
    NSLog(@"User did receive reward: %@ with amount: %ld", reward.name, (long)reward.amount);
}

@end
