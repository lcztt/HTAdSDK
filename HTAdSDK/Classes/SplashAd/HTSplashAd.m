//
//  HTSplashAd.m
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import "HTSplashAd.h"
#import <BUAdSDK/BUAdSDK.h>
#import "GDTSplashAd.h"
#import <BaiduMobAdSDK/BaiduMobAdSplash.h>
#import <BaiduMobAdSDK/BaiduMobAdSplashDelegate.h>


@interface HTSplashAd () <BUSplashAdDelegate, GDTSplashAdDelegate, BaiduMobAdSplashDelegate>

@property (nonatomic, strong) BUSplashAdView *csjSplashAd;
@property (nonatomic, strong) GDTSplashAd *gdtSplashAd;
@property (nonatomic, strong) BaiduMobAdSplash *bdSplashAd;

@property (nonatomic, assign) BOOL hasClick;

@end

@implementation HTSplashAd

- (void)loadAdData
{
    
}

- (void)showAdWithRootViewController:(UIViewController *)rootVC
{
//    self.splashView.rootViewController = rootVC;
//    [rootVC.view addSubview:self.splashView];
    self.hasClick = NO;
}

#pragma mark - 穿山甲 -

- (void)loadBUSplashAd
{
    CGRect frame = [UIScreen mainScreen].bounds;
    self.csjSplashAd = [[BUSplashAdView alloc] initWithSlotID:self.csjSlotId frame:frame];
    self.csjSplashAd.delegate = self;
    self.csjSplashAd.backgroundColor = [UIColor whiteColor];
    [self.csjSplashAd loadAdData];
}

#pragma mark - BUSplashAdDelegate

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

#pragma mark - 广点通 -

- (void)loadGDTSplashAd
{
    self.gdtSplashAd = [[GDTSplashAd alloc] init];
    self.gdtSplashAd.delegate = self;
    [self.gdtSplashAd loadAdAndShowInWindow:nil];
}

#pragma mark - GDTSplashAdDelegate
/**
 *  开屏广告成功展示
 */
- (void)splashAdSuccessPresentScreen:(GDTSplashAd *)splashAd
{
    
}

/**
 *  开屏广告素材加载成功
 */
//- (void)splashAdDidLoad:(GDTSplashAd *)splashAd
//{
    
//}

/**
 *  开屏广告展示失败
 */
- (void)splashAdFailToPresent:(GDTSplashAd *)splashAd withError:(NSError *)error
{
    
}

/**
 *  应用进入后台时回调
 *  详解: 当点击下载应用时会调用系统程序打开，应用切换到后台
 */
- (void)splashAdApplicationWillEnterBackground:(GDTSplashAd *)splashAd
{
    
}

/**
 *  开屏广告曝光回调
 */
- (void)splashAdExposured:(GDTSplashAd *)splashAd
{
    
}

/**
 *  开屏广告点击回调
 */
- (void)splashAdClicked:(GDTSplashAd *)splashAd
{
    
}

/**
 *  开屏广告将要关闭回调
 */
- (void)splashAdWillClosed:(GDTSplashAd *)splashAd
{
    
}

/**
 *  开屏广告关闭回调
 */
- (void)splashAdClosed:(GDTSplashAd *)splashAd
{
    
}

/**
 *  开屏广告点击以后即将弹出全屏广告页
 */
- (void)splashAdWillPresentFullScreenModal:(GDTSplashAd *)splashAd
{
    
}

/**
 *  开屏广告点击以后弹出全屏广告页
 */
- (void)splashAdDidPresentFullScreenModal:(GDTSplashAd *)splashAd
{
    
}

/**
 *  点击以后全屏广告页将要关闭
 */
- (void)splashAdWillDismissFullScreenModal:(GDTSplashAd *)splashAd
{
    
}

/**
 *  点击以后全屏广告页已经关闭
 */
- (void)splashAdDidDismissFullScreenModal:(GDTSplashAd *)splashAd
{
    
}

/**
 * 开屏广告剩余时间回调
 */
- (void)splashAdLifeTime:(NSUInteger)time
{
    
}

#pragma mark - 百度 -

- (void)loadBaiDuSplashAd
{
    self.bdSplashAd = [[BaiduMobAdSplash alloc] init];
    self.bdSplashAd.delegate = self;
    [self.bdSplashAd loadAndDisplayUsingContainerView:nil];
    
}

#pragma mark - BaiduMobAdSplashDelegate

/**
 *  应用的APPID
 */
- (NSString *)publisherId
{
    return self.appId;
}

/**
 *  渠道id
 */
- (NSString *)channelId
{
    return @"";
}

/**
 *  启动位置信息
 */
- (BOOL)enableLocation
{
    return false;
}

/**
 *  广告展示成功
 */
- (void)splashSuccessPresentScreen:(BaiduMobAdSplash *)splash
{
    
}

/**
 *  广告展示失败
 */
- (void)splashlFailPresentScreen:(BaiduMobAdSplash *)splash withError:(BaiduMobFailReason) reason
{
    
}

/**
 *  广告被点击
 */
- (void)splashDidClicked:(BaiduMobAdSplash *)splash
{
    
}

/**
 *  广告展示结束
 */
- (void)splashDidDismissScreen:(BaiduMobAdSplash *)splash
{
    
}

/**
 *  广告详情页消失
 */
- (void)splashDidDismissLp:(BaiduMobAdSplash *)splash
{
    
}

/**
 *  广告加载完成
 *  adType:广告类型 BaiduMobMaterialType
 *  videoDuration:视频时长，仅广告为视频时出现。非视频类广告默认0。 单位ms
 */
- (void)splashDidReady:(BaiduMobAdSplash *)splash
             AndAdType:(NSString *)adType
         VideoDuration:(NSInteger)videoDuration
{
    
}

/**
 * 开屏广告请求成功
 *
 * @param splash 开屏广告对象
 */
- (void)splashAdLoadSuccess:(BaiduMobAdSplash *)splash
{
    
}

/**
 * 开屏广告请求失败
 *
 * @param splash 开屏广告对象
 */
- (void)splashAdLoadFail:(BaiduMobAdSplash *)splash
{
    
}

@end
