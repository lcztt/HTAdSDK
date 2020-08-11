//
//  HTRewardVideoAdItem.h
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import <Foundation/Foundation.h>
#import "HTAdDefine.h"

@protocol HTRewardVideoAdDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface HTRewardVideoAdItem : NSObject

@property (nonatomic, weak) id <HTRewardVideoAdDelegate> delegate;

@property (nonatomic, assign) kVendorAdPlatform platform;

@property (nonatomic, copy) NSString *csjSlotId;
@property (nonatomic, copy) NSString *gdtSlotId;

@property (nonatomic, copy) NSString *bdAppId;
@property (nonatomic, copy) NSString *bdSlotId;

- (void)loadData;

// 记录 isAdValid 方法调用次数，
@property (nonatomic, assign, readonly) NSInteger checkValidCount;
- (BOOL)isAdValid;

- (void)showAdWithRootViewController:(UIViewController *)rootVC;

@end

@protocol HTRewardVideoAdDelegate <NSObject>

@optional
/**
 This method is called when video ad material loaded successfully.
 */
- (void)rewardedVideoAdDidLoad:(HTRewardVideoAdItem *)rewardedVideoAd;

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)rewardedVideoAd:(HTRewardVideoAdItem *)rewardedVideoAd didLoadFailWithError:(NSError *_Nullable)error;

/**
 This method is called when cached successfully.
 */
- (void)rewardedVideoAdDidDownLoadVideo:(HTRewardVideoAdItem *)rewardedVideoAd;

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)rewardedVideoAdViewRenderSuccess:(HTRewardVideoAdItem *)rewardedVideoAd;

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)rewardedVideoAdViewRenderFail:(HTRewardVideoAdItem *)rewardedVideoAd error:(NSError *_Nullable)error;

/**
 This method is called when video ad slot will be showing.
 */
- (void)rewardedVideoAdWillVisible:(HTRewardVideoAdItem *)rewardedVideoAd;


/**
 This method is called when video ad slot has been shown.
 */
- (void)rewardedVideoAdDidVisible:(HTRewardVideoAdItem *)rewardedVideoAd;

/**
 This method is called when video ad is about to close.
 */
- (void)rewardedVideoAdWillClose:(HTRewardVideoAdItem *)rewardedVideoAd;

/**
 This method is called when video ad is closed.
 */
- (void)rewardedVideoAdDidClose:(HTRewardVideoAdItem *)rewardedVideoAd;

/**
 This method is called when video ad is clicked.
 */
- (void)rewardedVideoAdDidClick:(HTRewardVideoAdItem *)rewardedVideoAd;

/**
 This method is called when the user clicked skip button.
 */
- (void)rewardedVideoAdDidClickSkip:(HTRewardVideoAdItem *)rewardedVideoAd;

/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)rewardedVideoAdDidPlayFinish:(HTRewardVideoAdItem *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error;

/**
 Server verification which is requested asynchronously is succeeded. now include two v erify methods:
      1. C2C need  server verify  2. S2S don't need server verify
 @param verify :return YES when return value is 2000.
 */
- (void)rewardedVideoAdServerRewardDidSucceed:(HTRewardVideoAdItem *)rewardedVideoAd verify:(BOOL)verify;

/**
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)rewardedVideoAdServerRewardDidFail:(HTRewardVideoAdItem *)rewardedVideoAd;

@end

NS_ASSUME_NONNULL_END
