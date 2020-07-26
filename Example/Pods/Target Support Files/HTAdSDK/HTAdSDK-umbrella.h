#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BaiduMobAdBaseNativeAdDelegate.h"
#import "BaiduMobAdBaseNativeAdObject.h"
#import "BaiduMobAdBaseNativeAdView.h"
#import "BaiduMobAdCommonConfig.h"
#import "BaiduMobAdDelegateProtocol.h"
#import "BaiduMobAdHybridAdManager.h"
#import "BaiduMobAdInterstitial.h"
#import "BaiduMobAdInterstitialDelegate.h"
#import "BaiduMobAdNative.h"
#import "BaiduMobAdNativeAdDelegate.h"
#import "BaiduMobAdNativeAdObject.h"
#import "BaiduMobAdNativeAdView.h"
#import "BaiduMobAdNativeVideoBaseView.h"
#import "BaiduMobAdNativeVideoView.h"
#import "BaiduMobAdNativeVideoViewDelegate.h"
#import "BaiduMobAdNativeWebView.h"
#import "BaiduMobAdPreroll.h"
#import "BaiduMobAdPrerollDelegate.h"
#import "BaiduMobAdRewardVideo.h"
#import "BaiduMobAdRewardVideoDelegate.h"
#import "BaiduMobAdSetting.h"
#import "BaiduMobAdSmartFeedView.h"
#import "BaiduMobAdSplash.h"
#import "BaiduMobAdSplashDelegate.h"
#import "BaiduMobAdVideoView.h"
#import "BaiduMobAdView.h"
#import "BaiduMobCpuInfoManager.h"
#import "BDAdSDKManager.h"
#import "HTBUAdSDKManager.h"
#import "HTGDTAdSDKManager.h"

FOUNDATION_EXPORT double HTAdSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char HTAdSDKVersionString[];

