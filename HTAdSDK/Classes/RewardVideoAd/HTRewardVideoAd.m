//
//  HTRewardVideoAd.m
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import "HTRewardVideoAd.h"
#import <BUAdSDK/BUAdSDK.h>
#import "GDTRewardVideoAd.h"
#import <BaiduMobAdSDK/BaiduMobAdRewardVideo.h>
#import <BaiduMobAdSDK/BaiduMobAdRewardVideoDelegate.h>
#import "HTAdDefine.h"

@interface HTRewardVideoAd ()
<BUNativeExpressRewardedVideoAdDelegate,
GDTRewardedVideoAdDelegate,
BaiduMobAdRewardVideoDelegate>

@property (nonatomic, strong) BUNativeExpressRewardedVideoAd *csjVideoAd;
@property (nonatomic, strong) GDTRewardVideoAd *gdtVideoAd;
@property (nonatomic, strong) BaiduMobAdRewardVideo *bdVideoAd;

// 记录当前队列中显示的广告索引
@property (nonatomic, assign) NSInteger preShowIndex;

@end


@implementation HTRewardVideoAd

+ (void)shareInstance
{
    static dispatch_once_t onceToken;
    static HTRewardVideoAd *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [[HTRewardVideoAd alloc] init];
    });
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.platformPriority = @[@(kVendorAdPlatformCSJ), @(kVendorAdPlatformGDT), @(kVendorAdPlatformBD)];
        self.preShowIndex = 0;
    }
    return self;
}

- (void)loadAd
{
    if ([self.platformPriority containsObject:@(kVendorAdPlatformCSJ)]) {
        if (!self.csjVideoAd.isAdValid) {
            [self loadCSJAd];
        }
    }
    
    if ([self.platformPriority containsObject:@(kVendorAdPlatformGDT)]) {
        if (!self.gdtVideoAd.isAdValid) {
            [self loadGDTAd];
        }
    }
    
    if ([self.platformPriority containsObject:@(kVendorAdPlatformBD)]) {
        if (![self.bdVideoAd isReady]) {
            [self loadBDAd];
        }
    }
}

- (void)showAdWithRootViewController:(UIViewController *)rootVC
{
    if (self.platformPriority.count > self.preShowIndex) {
        kVendorAdPlatform platform = [self.platformPriority[self.preShowIndex] integerValue];
        if (platform == kVendorAdPlatformCSJ) {
            [self.csjVideoAd showAdFromRootViewController:rootVC];
        } else if (platform == kVendorAdPlatformGDT) {
            [self.gdtVideoAd showAdFromRootViewController:rootVC];
        } else if (platform == kVendorAdPlatformBD) {
            [self.bdVideoAd showFromViewController:rootVC];
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
    NSLog(@"----------此方法在成功加载视频广告素材时调用。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidLoad:)]) {
        [self.delegate rewardedVideoAdDidLoad:self];
    }
}

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAd:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error
{
    NSLog(@"----------当视频广告材料加载失败时调用此方法。error.code = %ld", (long)error.code);
    
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAd:didFailWithError:)]) {
        [self.delegate rewardedVideoAd:self didLoadFailWithError:error];
    }
}

/**
  this methods is to tell delegate the type of native express rewarded video Ad
 */
- (void)nativeExpressRewardedVideoAdCallback:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd withType:(BUNativeExpressRewardedVideoAdType)nativeExpressVideoType
{
    
}

/**
 This method is called when cached successfully.
 */
- (void)nativeExpressRewardedVideoAdDidDownLoadVideo:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"----------成功缓存时调用此方法。");
//    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidDownLoadVideo:)]) {
//        [self.delegate rewardedVideoAdDidDownLoadVideo:self];
//    }
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdViewRenderSuccess:)]) {
        [self.delegate rewardedVideoAdViewRenderSuccess:self];
    }
}

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)nativeExpressRewardedVideoAdViewRenderSuccess:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"----------渲染成功时调用此方法。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdViewRenderSuccess:)]) {
        [self.delegate rewardedVideoAdViewRenderSuccess:self];
    }
}

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAdViewRenderFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd error:(NSError *_Nullable)error
{
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdViewRenderFail:error:)]) {
        [self.delegate rewardedVideoAdViewRenderFail:self error:error];
    }
}

/**
 This method is called when video ad slot will be showing.
 */
- (void)nativeExpressRewardedVideoAdWillVisible:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"----------此方法在显示视频广告槽时调用。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdWillVisible:)]) {
        [self.delegate rewardedVideoAdWillVisible:self];
    }
}

/**
 This method is called when video ad slot has been shown.
 */
- (void)nativeExpressRewardedVideoAdDidVisible:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"----------此方法在显示视频广告槽时调用。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidVisible:)]) {
        [self.delegate rewardedVideoAdDidVisible:self];
    }
}

/**
 This method is called when video ad is about to close.
 */
- (void)nativeExpressRewardedVideoAdWillClose:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"----------此方法在视频广告即将关闭时调用。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdWillClose:)]) {
        [self.delegate rewardedVideoAdWillClose:self];
    }
}

/**
 This method is called when video ad is closed.
 */
- (void)nativeExpressRewardedVideoAdDidClose:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"----------此方法在视频广告关闭时调用。");
    //    NSLog(@"-----------nativeExpressRewardedVideoAdDidClose");
    
    // 调用 js/ts 脚本中的函数： AppMain 节点下 iOSCtrl 脚本中的 GetAward 的函数。
//    [CallJS callJsCCNodeFunc_1:@"视屏广告看完了，发奖励罗！"];
    
    //视频结束后，再加载一次广告数据，保证广告的不重复
//    [self.rewardedVideoAd loadAdData];
    
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidClose:)]) {
        [self.delegate rewardedVideoAdDidClose:self];
    }
}

/**
 This method is called when video ad is clicked.
 */
- (void)nativeExpressRewardedVideoAdDidClick:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"----------此方法在单击视频广告时调用。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidClick:)]) {
        [self.delegate rewardedVideoAdDidClick:self];
    }
}


/**
 This method is called when the user clicked skip button.
 */
- (void)nativeExpressRewardedVideoAdDidClickSkip:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"----------此方法在单击视频广告时调用。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidClickSkip:)]) {
        [self.delegate rewardedVideoAdDidClickSkip:self];
    }
}


/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAdDidPlayFinish:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error
{
    NSLog(@"----------此方法在视频广告播放完成或发生错误时调用。error.code = %ld", (long)error.code);
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdDidPlayFinish:didFailWithError:)]) {
        [self.delegate rewardedVideoAdDidPlayFinish:self didFailWithError:error];
    }
}


/**
 Server verification which is requested asynchronously is succeeded. now include two v erify methods:
      1. C2C need  server verify  2. S2S don't need server verify
 @param verify :return YES when return value is 2000.
 */
- (void)nativeExpressRewardedVideoAdServerRewardDidSucceed:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd verify:(BOOL)verify
{
    NSLog(@"----------异步请求的服务器验证成功。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdServerRewardDidSucceed:verify:)]) {
        [self.delegate rewardedVideoAdServerRewardDidSucceed:self verify:verify];
    }
}


/**
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)nativeExpressRewardedVideoAdServerRewardDidFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"----------异步请求的服务器验证失败。");
    if ([self.delegate respondsToSelector:@selector(rewardedVideoAdServerRewardDidFail:)]) {
        [self.delegate rewardedVideoAdServerRewardDidFail:self];
    }
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpressRewardedVideoAdDidCloseOtherController:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd interactionType:(BUInteractionType)interactionType
{
    
}

#pragma mark - 广点通 -

- (void)loadGDTAd
{
    self.gdtVideoAd = [[GDTRewardVideoAd alloc] initWithAppId:self.appId placementId:self.gdtSlotId];
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
    
}

/**
 视频数据下载成功回调，已经下载过的视频会直接回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdVideoDidLoad:(GDTRewardVideoAd *)rewardedVideoAd
{
    
}

/**
 视频播放页即将展示回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdWillVisible:(GDTRewardVideoAd *)rewardedVideoAd
{
    
}

/**
 视频广告曝光回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidExposed:(GDTRewardVideoAd *)rewardedVideoAd
{
    
}

/**
 视频播放页关闭回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidClose:(GDTRewardVideoAd *)rewardedVideoAd
{
    
}

/**
 视频广告信息点击回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidClicked:(GDTRewardVideoAd *)rewardedVideoAd
{
    
}

/**
 视频广告各种错误信息回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 @param error 具体错误信息
 */
- (void)gdt_rewardVideoAd:(GDTRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error
{
    
}

/**
 视频广告播放达到激励条件回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidRewardEffective:(GDTRewardVideoAd *)rewardedVideoAd
{
    
}

/**
 视频广告视频播放完成

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidPlayFinish:(GDTRewardVideoAd *)rewardedVideoAd
{
    
}

#pragma mark - 百度 -

- (void)loadBDAd
{
    self.bdVideoAd = [[BaiduMobAdRewardVideo alloc] init];
    self.bdVideoAd.publisherId = self.appId;
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
    
}

/**
 * 激励视频广告请求失败
 */
- (void)rewardedAdLoadFail:(BaiduMobAdRewardVideo *)video
{
    
}

/**
 *  视频缓存成功
 */
- (void)rewardedVideoAdLoaded:(BaiduMobAdRewardVideo *)video
{
    
}

/**
 *  视频缓存失败
 */
- (void)rewardedVideoAdLoadFailed:(BaiduMobAdRewardVideo *)video withError:(BaiduMobFailReason)reason
{
    
}

/**
 *  视频开始播放
 */
- (void)rewardedVideoAdDidStarted:(BaiduMobAdRewardVideo *)video
{
    
}

/**
 *  广告展示失败
 */
- (void)rewardedVideoAdShowFailed:(BaiduMobAdRewardVideo *)video withError:(BaiduMobFailReason)reason
{
    
}

/**
 *  广告完成播放
 */
- (void)rewardedVideoAdDidPlayFinish:(BaiduMobAdRewardVideo *)video
{
    
}

/**
 *  用户点击关闭
 @param progress 当前播放进度 单位百分比 （注意浮点数）
 */
- (void)rewardedVideoAdDidClose:(BaiduMobAdRewardVideo *)video withPlayingProgress:(CGFloat)progress
{
    
}

/**
 *  用户点击下载/查看详情
 @param progress 当前播放进度 单位百分比
 */
- (void)rewardedVideoAdDidClick:(BaiduMobAdRewardVideo *)video withPlayingProgress:(CGFloat)progress
{
    
}

@end

