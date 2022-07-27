// For IronSource SDK Mediation Rewarded integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

#import "RewardedViewController.h"
#import "IronSource/IronSource.h"

@interface RewardedViewController () <ISRewardedVideoDelegate>

@property (weak, nonatomic) IBOutlet UIButton *showAdButton;

@end

@implementation RewardedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"IronSource Mediation Rewarded";
    [IronSource setRewardedVideoDelegate:self];
    self.showAdButton.enabled = [IronSource hasRewardedVideo];
}

- (IBAction)showAdTouchUpInside:(UIButton *)sender {
    if ([IronSource hasRewardedVideo]) {
        [IronSource showRewardedVideoWithViewController:self];
    } else {
        NSLog(@"Ad wasn't ready");
    }
}

#pragma mark - ISRewardedVideoDelegate

- (void)rewardedVideoHasChangedAvailability:(BOOL)available {
    if (available) {
        self.showAdButton.enabled = YES;
        NSLog(@"rewardedVideoHasChangedAvailability: YES");
    } else {
        self.showAdButton.enabled = NO;
        NSLog(@"rewardedVideoHasChangedAvailability: NO");
    }
}

- (void)didReceiveRewardForPlacement:(ISPlacementInfo *)placementInfo {
    NSLog(@"User did receive reward: %@ with amount: %@", placementInfo.rewardName, placementInfo.rewardAmount);
}

- (void)rewardedVideoDidFailToShowWithError:(NSError *)error {
    NSLog(@"Failed to show rewarded ad with error: %@", [error localizedDescription]);
}

- (void)rewardedVideoDidOpen {
    NSLog(@"rewardedVideoDidOpen");
}

- (void)rewardedVideoDidClose {
    NSLog(@"rewardedVideoDidClose");
}

- (void)rewardedVideoDidStart {
    NSLog(@"rewardedVideoDidStart");
}

- (void)rewardedVideoDidEnd {
    NSLog(@"rewardedVideoDidEnd");
}

- (void)didClickRewardedVideo:(ISPlacementInfo *)placementInfo{
    NSLog(@"didClickRewardedVideo");
}

@end
