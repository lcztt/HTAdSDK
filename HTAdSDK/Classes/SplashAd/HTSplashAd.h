//
//  HTSplashAd.h
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTSplashAd : NSObject

@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *csjSlotId;
@property (nonatomic, copy) NSString *gdtSlotId;
@property (nonatomic, copy) NSString *bdSlotId;

- (void)loadAdData;

- (void)showAdWithRootViewController:(UIViewController *)rootVC;

@end

@protocol HTSplashAdDelegate <NSObject>

@optional


@end

NS_ASSUME_NONNULL_END
