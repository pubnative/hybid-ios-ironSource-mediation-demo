// For IronSource SDK Mediation Banner integration, simply just follow IronSource's documentation.
// IronSource Mediation HyBid Adapters that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

#import "BannerViewController.h"
#import "IronSource/IronSource.h"

@interface BannerViewController () <LevelPlayBannerDelegate>

@property (weak, nonatomic) IBOutlet UIView *bannerAdContainer;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) ISBannerView *bannerView;

@end

@implementation BannerViewController

- (void)dealloc {
    [IronSource destroyBanner:self.bannerView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"IronSource Mediation Banner";
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self destroyBanner];
}

- (IBAction)loadAdTouchUpInside:(id)sender {
    [self.activityIndicator startAnimating];
    self.bannerAdContainer.hidden = YES;
    if (self.bannerView) {
        [self destroyBanner];
    }
    [IronSource setLevelPlayBannerDelegate:self];
    [IronSource loadBannerWithViewController:self size:ISBannerSize_BANNER];
}

- (void)destroyBanner {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.bannerView) {
            [IronSource destroyBanner:self.bannerView];
            self.bannerView = nil;
        }
    });
}

#pragma mark - LevelPlayBannerDelegate

- (void)didLoad:(ISBannerView *)bannerView withAdInfo:(ISAdInfo *)adInfo {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.bannerView = bannerView;
        self.bannerView.frame = CGRectMake(0, 0, self.bannerAdContainer.frame.size.width, self.bannerAdContainer.frame.size.height);
        self.bannerAdContainer.hidden = NO;
        [self.activityIndicator stopAnimating];
        [self.bannerAdContainer addSubview:self.bannerView];
    });
}

- (void)didFailToLoadWithError:(NSError *)error{
    [self.activityIndicator stopAnimating];
    NSLog(@"Failed to load banner ad with error: %@", [error localizedDescription]);
}

- (void)didClickWithAdInfo:(ISAdInfo *)adInfo{
    NSLog(@"didClickAd");
}

- (void)didLeaveApplicationWithAdInfo:(ISAdInfo *)adInfo{
    NSLog(@"didLeaveApplication");
}

- (void)didPresentScreenWithAdInfo:(ISAdInfo *)adInfo{
    NSLog(@"didPresentScreen");
}

- (void)didDismissScreenWithAdInfo:(ISAdInfo *)adInfo{
    NSLog(@"didDismissScreen");
}

@end
