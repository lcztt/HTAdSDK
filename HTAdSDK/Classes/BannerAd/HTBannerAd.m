//
//  HTBannerAd.m
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import "HTBannerAd.h"
#import <BUAdSDK/BUAdSDK.h>


@interface HTBannerAd () <BUNativeExpressBannerViewDelegate>

@property (nonatomic, strong, readwrite) BUNativeExpressBannerView *bannerView;

@end

@implementation HTBannerAd

- (instancetype)initWithSlotID:(NSString *)slotID rootViewController:(UIViewController *)vc adSize:(CGSize)adSize;
{
    if (self = [super init]) {
        self.bannerView = [[BUNativeExpressBannerView alloc] initWithSlotID:slotID
                                                         rootViewController:vc
                                                                     adSize:adSize
                                                          IsSupportDeepLink:YES];
        
        self.bannerView.frame = CGRectMake(0, 0, adSize.width, adSize.height);
        self.bannerView.delegate = self;
    }
    return self;
}

- (void)loadAdData
{
    [self.bannerView loadAdData];
}

#pragma mark - BUNativeExpressBannerViewDelegate -

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

@end
