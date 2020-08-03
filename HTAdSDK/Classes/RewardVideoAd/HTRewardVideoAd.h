//
//  HTRewardVideoAd.h
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import <Foundation/Foundation.h>

@protocol HTRewardVideoAdDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface HTRewardVideoAd : NSObject

@property (nonatomic, weak) id <HTRewardVideoAdDelegate> delegate;

- (instancetype)initWithSlotID:(NSString *)slotID;

-  (void)loadAdData;

- (void)showAdWithRootViewController:(UIViewController *)rootVC;

@end

@protocol HTRewardVideoAdDelegate <NSObject>

@optional
/**
 This method is called when video ad material loaded successfully.
 */
- (void)rewardedVideoAdDidLoad:(HTRewardVideoAd *)rewardedVideoAd;

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)rewardedVideoAd:(HTRewardVideoAd *)rewardedVideoAd didLoadFailWithError:(NSError *_Nullable)error;

/**
 This method is called when cached successfully.
 */
- (void)rewardedVideoAdDidDownLoadVideo:(HTRewardVideoAd *)rewardedVideoAd;

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)rewardedVideoAdViewRenderSuccess:(HTRewardVideoAd *)rewardedVideoAd;

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)rewardedVideoAdViewRenderFail:(HTRewardVideoAd *)rewardedVideoAd error:(NSError *_Nullable)error;

/**
 This method is called when video ad slot will be showing.
 */
- (void)rewardedVideoAdWillVisible:(HTRewardVideoAd *)rewardedVideoAd;


/**
 This method is called when video ad slot has been shown.
 */
- (void)rewardedVideoAdDidVisible:(HTRewardVideoAd *)rewardedVideoAd;

/**
 This method is called when video ad is about to close.
 */
- (void)rewardedVideoAdWillClose:(HTRewardVideoAd *)rewardedVideoAd;

/**
 This method is called when video ad is closed.
 */
- (void)rewardedVideoAdDidClose:(HTRewardVideoAd *)rewardedVideoAd;

/**
 This method is called when video ad is clicked.
 */
- (void)rewardedVideoAdDidClick:(HTRewardVideoAd *)rewardedVideoAd;

/**
 This method is called when the user clicked skip button.
 */
- (void)rewardedVideoAdDidClickSkip:(HTRewardVideoAd *)rewardedVideoAd;

/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)rewardedVideoAdDidPlayFinish:(HTRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error;

/**
 Server verification which is requested asynchronously is succeeded. now include two v erify methods:
      1. C2C need  server verify  2. S2S don't need server verify
 @param verify :return YES when return value is 2000.
 */
- (void)rewardedVideoAdServerRewardDidSucceed:(HTRewardVideoAd *)rewardedVideoAd verify:(BOOL)verify;

/**
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)rewardedVideoAdServerRewardDidFail:(HTRewardVideoAd *)rewardedVideoAd;

@end

NS_ASSUME_NONNULL_END
