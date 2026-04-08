#import "AppDelegate.h"

// Step 1: Import HyBid into your class
#import <HyBid/HyBid.h>
#if __has_include(<HyBid/HyBid-Swift.h>)
    #import <HyBid/HyBid-Swift.h>
#else
    #import "HyBid-Swift.h"
#endif

#define APP_TOKEN @"543027b8e954474cbcd9a98481622a3b"
#define APP_KEY @"255e942fd"
#define APP_STORE_ID @"1530210244"

// Step 2: Import IronSource SDK into your class
#import "IronSource/IronSource.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Step 3: Setup & Initialize HyBid SDK
        [HyBid initWithAppToken:APP_TOKEN completion:nil];
    // Step 4: Set COPPA (Optional)
        [HyBid setCoppa:NO];
    // Step 5: Set Test Mode (Optional)
        [HyBid setTestMode:YES];
    // Step 6: Set Location Tracking (Optional)
        [HyBid setLocationTracking:YES];
    // Step 7: Set Targeting (Optional)
        HyBidTargetingModel *targeting = [[HyBidTargetingModel alloc] init];
        targeting.age = [NSNumber numberWithInt:28];
        targeting.interests = @[@"music"];
        targeting.gender = @"f";     // "f" for female, "m" for male
        [HyBid setTargeting:targeting];
    // Step 8: Set HyBid log level (Optional)
        [HyBidLogger setLogLevel:HyBidLogLevelDebug];
    // Step 9: Setup & Initialize IronSource SDK using the LevelPlay Init API
        LPMInitRequest *initRequest = [[[LPMInitRequestBuilder alloc] initWithAppKey:APP_KEY]
                                       withUserId:@""].build;
        [LevelPlay initWithRequest:initRequest completion:^(LPMConfiguration * _Nullable config, NSError * _Nullable error) {
            if (error) {
                NSLog(@"LevelPlay init failed: %@", error.localizedDescription);
            } else {
                NSLog(@"LevelPlay init succeeded");
            }
        }];

    return YES;
}

#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

@end
