//
//  HTRewardVideoAd.m
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import "HTRewardVideoAd.h"
#import <BUAdSDK/BUAdSDK.h>

@interface HTRewardVideoAd () <BUNativeExpressRewardedVideoAdDelegate>

@property (nonatomic,strong) BUNativeExpressRewardedVideoAd *rewardedVideoAd;

@end


@implementation HTRewardVideoAd

- (instancetype)initWithSlotID:(NSString *)slotID
{
    self = [super init];
    if (self) {
        BURewardedVideoModel *model= [[BURewardedVideoModel alloc] init];
//        model.userId = SAFESTRING(@([APPUser shareInstance].uid));
        
        self.rewardedVideoAd = [[BUNativeExpressRewardedVideoAd alloc] initWithSlotID:slotID rewardedVideoModel:model];
        self.rewardedVideoAd.delegate = self;
    }
    return self;
}

-  (void)loadAdData
{
    [self.rewardedVideoAd loadAdData];
}

- (void)showAdWithRootViewController:(UIViewController *)rootVC
{
    BOOL success = [self.rewardedVideoAd showAdFromRootViewController:rootVC];
    NSLog(@"success: %@", @(success));
}

#pragma mark - BURewardedVideoAdDelegate -
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

@end
