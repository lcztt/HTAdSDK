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
 * 激励视频广告请求成功
 */
- (void)rewardedAdLoadSuccess:(HTRewardVideoAdItem *)videoAd;

/**
 * 激励视频广告请求失败
 */
- (void)rewardedAdLoadFail:(HTRewardVideoAdItem *)videoAd;

/**
 *  视频开始播放
 */
- (void)rewardedVideoAdDidStarted:(HTRewardVideoAdItem *)videoAd;

/**
 *  广告展示失败
 */
- (void)rewardedVideoAdShowFailed:(HTRewardVideoAdItem *)videoAd;

/**
 *  广告完成播放
 */
- (void)rewardedVideoAdDidPlayFinish:(HTRewardVideoAdItem *)videoAd;

/**
 *  用户点击关闭
 */
- (void)rewardedVideoAdDidClose:(HTRewardVideoAdItem *)videoAd;

@end

NS_ASSUME_NONNULL_END
