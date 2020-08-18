//
//  HTRewardVideoAdItem.m
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import "HTRewardVideoAdItem.h"
#import <BUAdSDK/BUAdSDK.h>
#import "GDTRewardVideoAd.h"
#import <BaiduMobAdSDK/BaiduMobAdRewardVideo.h>
#import <BaiduMobAdSDK/BaiduMobAdRewardVideoDelegate.h>

@interface HTRewardVideoAdItem ()
<BUNativeExpressRewardedVideoAdDelegate,
GDTRewardedVideoAdDelegate,
BaiduMobAdRewardVideoDelegate>

@property (nonatomic, strong) BUNativeExpressRewardedVideoAd *csjVideoAd;
@property (nonatomic, strong) GDTRewardVideoAd *gdtVideoAd;
@property (nonatomic, strong) BaiduMobAdRewardVideo *bdVideoAd;

@property (nonatomic, assign, readwrite) NSInteger checkValidCount;

@end


@implementation HTRewardVideoAdItem

- (void)loadData
{
    self.checkValidCount = 0;
    
    if (self.platform == kVendorAdPlatformCSJ) {
        [self loadCSJAd];
    } else if (self.platform == kVendorAdPlatformGDT) {
        [self loadGDTAd];
    } else if (self.platform == kVendorAdPlatformBD) {
        [self loadBDAd];
    }
}

- (BOOL)isAdValid
{
    self.checkValidCount++;
    
    if (self.platform == kVendorAdPlatformCSJ) {
        return self.csjVideoAd.isAdValid;
    } else if (self.platform == kVendorAdPlatformGDT) {
        return self.gdtVideoAd.isAdValid;
    } else if (self.platform == kVendorAdPlatformBD) {
        return [self.bdVideoAd isReady];
    }
    return false;
}

- (void)showAdWithRootViewController:(UIViewController *)rootVC
{
    if (self.platform == kVendorAdPlatformCSJ) {
        if (self.csjVideoAd.isAdValid) {
            [self.csjVideoAd showAdFromRootViewController:rootVC];
        } else {
            NSLog(@"穿山甲视频广告数据不可用");
        }
    } else if (self.platform == kVendorAdPlatformGDT) {
        if (self.gdtVideoAd.isAdValid) {
            [self.gdtVideoAd showAdFromRootViewController:rootVC];
        } else {
            NSLog(@"广点通视频广告数据不可用");
        }
    } else if (self.platform == kVendorAdPlatformBD) {
        if ([self.bdVideoAd isReady]) {
            [self.bdVideoAd showFromViewController:rootVC];
        } else {
            NSLog(@"百度视频广告数据不可用");
        }
    }
}

#pragma mark - 穿山甲 -

- (void)loadCSJAd
{
    BURewardedVideoModel *model= [[BURewardedVideoModel alloc] init];
    self.csjVideoAd = [[BUNativeExpressRewardedVideoAd alloc] initWithSlotID:self.csjSlotId rewardedVideoModel:model];
    self.csjVideoAd.delegate = self;
    [self.csjVideoAd loadAdData];
}

#pragma mark - BURewardedVideoAdDelegate

/**
 This method is called when video ad material loaded successfully.
 */
- (void)nativeExpressRewardedVideoAdDidLoad:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"穿山甲----------此方法在成功加载视频广告素材时调用。");
    
}

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAd:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error
{
    NSLog(@"穿山甲----------当视频广告材料加载失败时调用此方法。error.code = %ld", (long)error.code);
    
    if ([self.delegate respondsToSelector:@selector(rewardedAdLoadFail:)]) {
        [self.delegate rewardedAdLoadFail:error];
    }
}

/**
  this methods is to tell delegate the type of native express rewarded video Ad
 */
- (void)nativeExpressRewardedVideoAdCallback:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd withType:(BUNativeExpressRewardedVideoAdType)nativeExpressVideoType
{
    NSLog(@"穿山甲----------视频广告渲染好后回调");
}

/**
 This method is called when cached successfully.
 */
- (void)nativeExpressRewardedVideoAdDidDownLoadVideo:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"穿山甲----------成功缓存时调用此方法。");
    if ([self.delegate respondsToSelector:@selector(rewardedAdLoadSuccess:)]) {
        [self.delegate rewardedAdLoadSuccess:self];
    }
}

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)nativeExpressRewardedVideoAdViewRenderSuccess:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"穿山甲----------渲染成功时调用此方法。");
    
}

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAdViewRenderFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd error:(NSError *_Nullable)error
{
    NSLog(@"穿山甲----------模板渲染失败：%@" [error description]);
}

/**
 This method is called when video ad slot will be showing.
 */
- (void)nativeExpressRewardedVideoAdWillVisible:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"穿山甲----------此方法在显示视频广告槽时调用。");
    
}

/**
 This method is called when video ad slot has been shown.
 */
- (void)nativeExpressRewardedVideoAdDidVisible:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"穿山甲----------此方法在显示视频广告槽时调用。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidStarted:)]) {
        [self.delegate rewardedVideoAdDidStarted:self];
    }
}

/**
 This method is called when video ad is about to close.
 */
- (void)nativeExpressRewardedVideoAdWillClose:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"穿山甲----------此方法在视频广告即将关闭时调用。");
}

/**
 This method is called when video ad is closed.
 */
- (void)nativeExpressRewardedVideoAdDidClose:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"穿山甲----------此方法在视频广告关闭时调用。");
    
    //视频结束后，再加载一次广告数据，保证广告的不重复
//    [self.csjVideoAd loadAdData];
    
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidClose:)]) {
        [self.delegate rewardedVideoAdDidClose:self];
    }
}

/**
 This method is called when video ad is clicked.
 */
- (void)nativeExpressRewardedVideoAdDidClick:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"穿山甲----------此方法在单击视频广告时调用。");
    
}


/**
 This method is called when the user clicked skip button.
 */
- (void)nativeExpressRewardedVideoAdDidClickSkip:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"穿山甲----------此方法在单击视频广告时调用。");
    
}


/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAdDidPlayFinish:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error
{
    NSLog(@"穿山甲----------此方法在视频广告播放完成或发生错误时调用。error.code = %ld", (long)error.code);
    if (!error) {
        if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidPlayFinish:)]) {
            [self.delegate rewardedVideoAdDidPlayFinish:error];
        }
    } else {
        if ([self.delegate respondsToSelector:@selector(rewardedVideoAdShowFailed:)]) {
            [self.delegate rewardedVideoAdShowFailed:error];
        }
    }
}


/**
 Server verification which is requested asynchronously is succeeded. now include two v erify methods:
      1. C2C need  server verify  2. S2S don't need server verify
 @param verify :return YES when return value is 2000.
 */
- (void)nativeExpressRewardedVideoAdServerRewardDidSucceed:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd verify:(BOOL)verify
{
    NSLog(@"穿山甲----------异步请求的服务器验证成功。");
    
}


/**
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)nativeExpressRewardedVideoAdServerRewardDidFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"穿山甲----------异步请求的服务器验证失败。");
    
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpressRewardedVideoAdDidCloseOtherController:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd interactionType:(BUInteractionType)interactionType
{
    NSLog(@"穿山甲----------关闭其他controller。");
}

#pragma mark - 广点通 -

- (void)loadGDTAd
{
    self.gdtVideoAd = [[GDTRewardVideoAd alloc] initWithPlacementId:self.gdtSlotId];
    self.gdtVideoAd.delegate = self;
    [self.gdtVideoAd loadAd];
}

#pragma mark - GDTRewardedVideoAdDelegate
/**
 广告数据加载成功回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidLoad:(GDTRewardVideoAd *)rewardedVideoAd
{
    NSLog(@"广点通----------广告数据加载成功。");
    if ([self.delegate respondsToSelector:@selector(rewardedAdLoadSuccess:)]) {
        [self.delegate rewardedAdLoadSuccess:self];
    }
}

/**
 视频数据下载成功回调，已经下载过的视频会直接回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdVideoDidLoad:(GDTRewardVideoAd *)rewardedVideoAd
{
    NSLog(@"广点通----------视频数据下载成功。");
}

/**
 视频播放页即将展示回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdWillVisible:(GDTRewardVideoAd *)rewardedVideoAd
{
    NSLog(@"广点通----------视频播放页即将展示。");
}

/**
 视频广告曝光回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidExposed:(GDTRewardVideoAd *)rewardedVideoAd
{
    NSLog(@"广点通----------视频广告曝光。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidStarted:)]) {
        [self.delegate rewardedVideoAdDidStarted:self];
    }
}

/**
 视频播放页关闭回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidClose:(GDTRewardVideoAd *)rewardedVideoAd
{
    NSLog(@"广点通----------视频播放页关闭。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidClose:)]) {
        [self.delegate rewardedVideoAdDidClose:self];
    }
}

/**
 视频广告信息点击回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidClicked:(GDTRewardVideoAd *)rewardedVideoAd
{
    NSLog(@"广点通----------点击视频广告。");
}

/**
 视频广告各种错误信息回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 @param error 具体错误信息
 */
- (void)gdt_rewardVideoAd:(GDTRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error
{
    NSLog(@"广点通----------视频广告各种错误信息回调:%@", [error description]);
}

/**
 视频广告播放达到激励条件回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidRewardEffective:(GDTRewardVideoAd *)rewardedVideoAd
{
    NSLog(@"广点通----------视频广告播放达到激励条件。");
}

/**
 视频广告视频播放完成

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidPlayFinish:(GDTRewardVideoAd *)rewardedVideoAd
{
    NSLog(@"广点通----------视频广告视频播放完成。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidPlayFinish:)]) {
        [self.delegate rewardedVideoAdDidPlayFinish:self];
    }
}

#pragma mark - 百度 -

- (void)loadBDAd
{
    self.bdVideoAd = [[BaiduMobAdRewardVideo alloc] init];
    self.bdVideoAd.publisherId = self.bdAppId;
    self.bdVideoAd.AdUnitTag = self.bdSlotId;
    self.bdVideoAd.delegate = self;
    [self.bdVideoAd load];
}

#pragma mark - BaiduMobAdRewardVideoDelegate
/**
 * 激励视频广告请求成功
 */
- (void)rewardedAdLoadSuccess:(BaiduMobAdRewardVideo *)video
{
    NSLog(@"百度----------激励视频广告请求成功。");
    if ([self.delegate respondsToSelector:@selector(rewardedAdLoadSuccess:)]) {
        [self.delegate rewardedAdLoadSuccess:self];
    }
}

/**
 * 激励视频广告请求失败
 */
- (void)rewardedAdLoadFail:(BaiduMobAdRewardVideo *)video
{
    NSLog(@"百度----------激励视频广告请求失败。");
    if ([self.delegate respondsToSelector:@selector(rewardedAdLoadFail:)]) {
        [self.delegate rewardedAdLoadFail:self];
    }
}

/**
 *  视频缓存成功
 */
- (void)rewardedVideoAdLoaded:(BaiduMobAdRewardVideo *)video
{
    NSLog(@"百度----------视频缓存成功。");
}

/**
 *  视频缓存失败
 */
- (void)rewardedVideoAdLoadFailed:(BaiduMobAdRewardVideo *)video withError:(BaiduMobFailReason)reason
{
    NSLog(@"百度----------视频缓存失败。");
}

/**
 *  视频开始播放
 */
- (void)rewardedVideoAdDidStarted:(BaiduMobAdRewardVideo *)video
{
    NSLog(@"百度----------视频开始播放。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidStarted:)]) {
        [self.delegate rewardedVideoAdDidStarted:self];
    }
}

/**
 *  广告展示失败
 */
- (void)rewardedVideoAdShowFailed:(BaiduMobAdRewardVideo *)video withError:(BaiduMobFailReason)reason
{
    NSLog(@"百度----------广告展示失败。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdShowFailed:)]) {
        [self.delegate rewardedVideoAdShowFailed:self];
    }
}

/**
 *  广告完成播放
 */
- (void)rewardedVideoAdDidPlayFinish:(BaiduMobAdRewardVideo *)video
{
    NSLog(@"百度----------广告完成播放。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidPlayFinish:)]) {
        [self.delegate rewardedVideoAdDidPlayFinish:self];
    }
}

/**
 *  用户点击关闭
 @param progress 当前播放进度 单位百分比 （注意浮点数）
 */
- (void)rewardedVideoAdDidClose:(BaiduMobAdRewardVideo *)video withPlayingProgress:(CGFloat)progress
{
    NSLog(@"百度----------用户点击关闭。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidClose:)]) {
        [self.delegate rewardedVideoAdDidClose:self];
    }
}

/**
 *  用户点击下载/查看详情
 @param progress 当前播放进度 单位百分比
 */
- (void)rewardedVideoAdDidClick:(BaiduMobAdRewardVideo *)video withPlayingProgress:(CGFloat)progress
{
    NSLog(@"百度----------用户点击下载/查看详情。");
}

@end

