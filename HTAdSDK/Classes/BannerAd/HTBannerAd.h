//
//  HTBannerAd.h
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface HTBannerAd : NSObject

- (instancetype)initWithSlotID:(NSString *)slotID rootViewController:(UIViewController *)vc adSize:(CGSize)adSize;

//@property (nonatomic, strong, readonly) BUNativeExpressBannerView *bannerView;

- (void)loadAdData;

@end

NS_ASSUME_NONNULL_END
