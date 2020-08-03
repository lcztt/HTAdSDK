//
//  HTSplashAd.m
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import "HTSplashAd.h"

#import <BUAdSDK/BUAdSDK.h>


@interface HTSplashAd () <BUSplashAdDelegate>

@property (nonatomic, strong) BUSplashAdView *splashView;
@property (nonatomic, assign) BOOL hasClick;

@end

@implementation HTSplashAd

- (void)dealloc
{
    NSLog(@"dealloc");
}

- (instancetype)initWithSlotID:(NSString *)slotID
{
    if (self = [super init]) {
        CGRect frame = [UIScreen mainScreen].bounds;
        BUSplashAdView *splashView = [[BUSplashAdView alloc] initWithSlotID:slotID frame:frame];
        splashView.delegate = self;
        [splashView loadAdData];
        self.splashView.backgroundColor = [UIColor whiteColor];
        self.splashView = splashView;
    }
    return self;
}

- (void)loadAdData
{
    [self.splashView loadAdData];
}

- (void)showAdWithRootViewController:(UIViewController *)rootVC
{
    self.splashView.rootViewController = rootVC;
    [rootVC.view addSubview:self.splashView];
    self.hasClick = NO;
}

#pragma mark - BUSplashAdDelegate -

/**
 This method is called when splash ad material loaded successfully.
 */
- (void)splashAdDidLoad:(BUSplashAdView *)splashAd
{
    
}

/**
 This method is called when splash ad material failed to load.
 @param error : the reason of error
 */
- (void)splashAd:(BUSplashAdView *)splashAd didFailWithError:(NSError * _Nullable)error
{
//    [splashAd removeFromSuperview];
//    [SBGameManager startGame];
//    [[SBHomeManager shareInstance] openApp];
}

/**
 This method is called when splash ad slot will be showing.
 */
- (void)splashAdWillVisible:(BUSplashAdView *)splashAd
{
    NSLog(@"splashAdWillVisible");
}

/**
 This method is called when splash ad is clicked.
 */
- (void)splashAdDidClick:(BUSplashAdView *)splashAd
{
    NSLog(@"click");
    self.hasClick = YES;
}

/**
 This method is called when splash ad is closed.
 */
- (void)splashAdDidClose:(BUSplashAdView *)splashAd
{
//    [splashAd removeFromSuperview];
//    [SBGameManager startGame];
//    if (!self.hasClick) {
//        [[SBHomeManager shareInstance] openApp];
//    }
}

/**
 This method is called when splash ad is about to close.
 */
- (void)splashAdWillClose:(BUSplashAdView *)splashAd
{
    
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)splashAdDidCloseOtherController:(BUSplashAdView *)splashAd interactionType:(BUInteractionType)interactionType
{
    NSLog(@"close");
}

/**
 This method is called when spalashAd skip button  is clicked.
 */
- (void)splashAdDidClickSkip:(BUSplashAdView *)splashAd
{
    
}

/**
 This method is called when spalashAd countdown equals to zero
 */
- (void)splashAdCountdownToZero:(BUSplashAdView *)splashAd
{
    
}

@end
