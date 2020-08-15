//
//  HTAdSDKManager.m
//  HTAdSDK
//
//  Created by vitas on 2020/7/31.
//

#import "HTAdSDKManager.h"
#import <BUAdSDK/BUAdSDK.h>
#import "GDTSDKConfig.h"
#import <BaiduMobAdSDK/BaiduMobAdSetting.h>

@implementation HTAdSDKManager

+ (void)registGDTSDKWithAppId:(NSString *)appId
{
    [GDTSDKConfig registerAppId:appId];
    NSLog(@"GDT version %@", GDTSDKConfig.sdkVersion);
}

+ (void)registCSJSDK
{
#if DEBUG
    [BUAdSDKManager setLoglevel:BUAdSDKLogLevelDebug];
#else
    [BUAdSDKManager setLoglevel:BUAdSDKLogLevelNone];
#endif
    
    [BUAdSDKManager setIsPaidApp:NO];
    
    NSLog(@"BU version %@", BUAdSDKManager.SDKVersion);
}

+ (void)registBDSDK
{
    NSLog(@"Baidu version %@", SDK_VERSION_IN_MSSP);
}

@end
    
