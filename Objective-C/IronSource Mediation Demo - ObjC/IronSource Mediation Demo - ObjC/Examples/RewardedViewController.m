// For IronSource SDK Mediation Rewarded integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

#import "RewardedViewController.h"
#import "IronSource/IronSource.h"

@interface RewardedViewController () <LevelPlayRewardedVideoDelegate>

@property (weak, nonatomic) IBOutlet UIButton *showAdButton;

@end

@implementation RewardedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"IronSource Mediation Rewarded";
    [IronSource setLevelPlayRewardedVideoDelegate:self];
    self.showAdButton.enabled = [IronSource hasRewardedVideo];
}

- (IBAction)showAdTouchUpInside:(UIButton *)sender {
    if ([IronSource hasRewardedVideo]) {
        [IronSource showRewardedVideoWithViewController:self];
    } else {
        NSLog(@"Ad wasn't ready");
    }
}

#pragma mark - LevelPlayRewardedVideoDelegate

- (void)hasAvailableAdWithAdInfo:(ISAdInfo *)adInfo {
    self.showAdButton.enabled = YES;
    NSLog(@"hasAvailableAd");
}

- (void)hasNoAvailableAd {
    self.showAdButton.enabled = NO;
    NSLog(@"hasNoAvailableAd");
}

- (void)didReceiveRewardForPlacement:(ISPlacementInfo *)placementInfo withAdInfo:(ISAdInfo *)adInfo {
    NSLog(@"User did receive reward: %@ with amount: %@", placementInfo.rewardName, placementInfo.rewardAmount);
}

- (void)didFailToShowWithError:(NSError *)error andAdInfo:(ISAdInfo *)adInfo {
    NSLog(@"Failed to show rewarded ad with error: %@", [error localizedDescription]);
}

- (void)didOpenWithAdInfo:(ISAdInfo *)adInfo {
    NSLog(@"rewardedVideoDidOpen");
}

- (void)didCloseWithAdInfo:(ISAdInfo *)adInfo {
    NSLog(@"rewardedVideoDidClose");
}

- (void)didClick:(ISPlacementInfo *)placementInfo withAdInfo:(ISAdInfo *)adInfo {
    NSLog(@"didClickRewardedVideo");
}

@end
