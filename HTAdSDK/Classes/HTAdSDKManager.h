//
//  HTAdSDKManager.h
//  HTAdSDK
//
//  Created by vitas on 2020/7/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTAdSDKManager : NSObject

+ (void)registCSJSDKWithAppId:(NSString *)appId;

+ (void)registGDTSDKWithAppId:(NSString *)appId;

+ (void)registBDSDK;

@end

NS_ASSUME_NONNULL_END
