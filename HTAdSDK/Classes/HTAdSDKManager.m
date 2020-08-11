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

+ (void)initSDK
{
    [BUAdSDKManager setLoglevel:BUAdSDKLogLevelDebug];
    [BUAdSDKManager setIsPaidApp:NO];
    
    [GDTSDKConfig registerAppId:@""];
    
    NSLog(@"GDT version %@", GDTSDKConfig.sdkVersion);
    NSLog(@"BU version %@", BUAdSDKManager.SDKVersion);
    NSLog(@"Baidu version %@", SDK_VERSION_IN_MSSP);

    
}

@end
    
