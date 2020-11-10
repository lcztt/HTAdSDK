//
//  HTBannerAd.m
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import "HTBannerAd.h"
#import <BUAdSDK/BUAdSDK.h>
#import "GDTUnifiedBannerView.h"
#import <BaiduMobAdSDK/BaiduMobAdView.h>
#import <BaiduMobAdSDK/BaiduMobAdDelegateProtocol.h>


@interface HTBannerAd () <BUNativeExpressBannerViewDelegate,
GDTUnifiedBannerViewDelegate, BaiduMobAdViewDelegate>

@property (nonatomic, strong) BUNativeExpressBannerView *csjAdView;
@property (nonatomic, strong) GDTUnifiedBannerView *gdtAdView;
@property (nonatomic, strong) BaiduMobAdView *bdAdView;

@end

@implementation HTBannerAd


- (void)loadAdData
{
    
}

#pragma mark - 穿山甲 -

- (void)loadCSJAd
{
    self.csjAdView = [[BUNativeExpressBannerView alloc] initWithSlotID:self.gdtSlotId
                                                    rootViewController:nil
                                                                adSize:CGSizeZero];
    self.csjAdView.delegate = self;
    [self.csjAdView loadAdData];
}

#pragma mark - BUNativeExpressBannerViewDelegate

/**
 This method is called when bannerAdView ad slot loaded successfully.
 @param bannerAdView : view for bannerAdView
 */
- (void)nativeExpressBannerAdViewDidLoad:(BUNativeExpressBannerView *)bannerAdView
{
    
}

/**
 This method is called when bannerAdView ad slot failed to load.
 @param error : the reason of error
 */
- (void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView didLoadFailWithError:(NSError *_Nullable)error
{
    
}

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)nativeExpressBannerAdViewRenderSuccess:(BUNativeExpressBannerView *)bannerAdView
{
    
}

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)nativeExpressBannerAdViewRenderFail:(BUNativeExpressBannerView *)bannerAdView error:(NSError * __nullable)error
{
    
}

/**
 This method is called when bannerAdView ad slot showed new ad.
 */
- (void)nativeExpressBannerAdViewWillBecomVisible:(BUNativeExpressBannerView *)bannerAdView
{
    
}

/**
 This method is called when bannerAdView is clicked.
 */
- (void)nativeExpressBannerAdViewDidClick:(BUNativeExpressBannerView *)bannerAdView
{
    
}

/**
 This method is called when the user clicked dislike button and chose dislike reasons.
 @param filterwords : the array of reasons for dislike.
 */
- (void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView dislikeWithReason:(NSArray<BUDislikeWords *> *_Nullable)filterwords
{
    
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpressBannerAdViewDidCloseOtherController:(BUNativeExpressBannerView *)bannerAdView interactionType:(BUInteractionType)interactionType
{
    
}

#pragma mark - 广点通 -

- (void)loadGDTAd
{
    self.gdtAdView = [[GDTUnifiedBannerView alloc] initWithPlacementId:self.gdtSlotId viewController:nil];
    self.gdtAdView.delegate = self;
    [self.gdtAdView loadAdAndShow];
}

#pragma mark - GDTMobBannerViewDelegate

- (void)bannerViewMemoryWarning
{
    
}

/**
 *  请求广告条数据成功后调用
 *  详解:当接收服务器返回的广告数据成功后调用该函数
 */
- (void)bannerViewDidReceived
{
    
}

/**
 *  请求广告条数据失败后调用
 *  详解:当接收服务器返回的广告数据失败后调用该函数
 */
- (void)bannerViewFailToReceived:(NSError *)error
{
    
}

/**
 *  详解:当点击应用下载或者广告调用系统程序打开时调用
 */
- (void)bannerViewWillLeaveApplication
{
    
}

/**
 *  banner条被用户关闭时调用
 *  详解:当打开showCloseBtn开关时，用户有可能点击关闭按钮从而把广告条关闭
 */
- (void)bannerViewWillClose
{
    
}
/**
 *  banner条曝光回调
 */
- (void)bannerViewWillExposure
{
    
}
/**
 *  banner条点击回调
 */
- (void)bannerViewClicked
{
    
}

/**
 *  banner广告点击以后即将弹出全屏广告页
 */
- (void)bannerViewWillPresentFullScreenModal
{
    
}
/**
 *  banner广告点击以后弹出全屏广告页完毕
 */
- (void)bannerViewDidPresentFullScreenModal
{
    
}
/**
 *  全屏广告页即将被关闭
 */
- (void)bannerViewWillDismissFullScreenModal
{
    
}
/**
 *  全屏广告页已经被关闭
 */
- (void)bannerViewDidDismissFullScreenModal
{
    
}

#pragma mark - 百度 -

- (void)loadBaiDuAd
{
    self.bdAdView = [[BaiduMobAdView alloc] init];
    self.bdAdView.delegate = self;
    [self.bdAdView start];
}

#pragma mark - BaiduMobAdViewDelegate

/**
 *  应用的APPID
 */
- (NSString *)publisherId
{
    return self.appId;
}

/**
 *  渠道ID
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
 *  广告将要被载入
 */
- (void)willDisplayAd:(BaiduMobAdView *)adview
{
    
}

/**
 *  广告载入失败
 */
- (void)failedDisplayAd:(BaiduMobFailReason)reason
{
    
}

/**
 *  本次广告展示成功时的回调
 */
- (void)didAdImpressed
{
    
}

/**
 *  本次广告展示被用户点击时的回调
 */
- (void)didAdClicked
{
    
}

/**
 *  在用户点击完广告条出现全屏广告页面以后，用户关闭广告时的回调
 */
- (void)didDismissLandingPage
{
    
}

/**
 *  用户点击关闭按钮关闭广告后的回调
 */
- (void)didAdClose
{
    
}

@end
