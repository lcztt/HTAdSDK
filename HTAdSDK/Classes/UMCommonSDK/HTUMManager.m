//
//  HTUMManager.m
//  AllPopMake-mobile
//
//  Created by vitas on 2020/7/22.
//  Copyright © 2020 SB. All rights reserved.
//

#import "HTUMManager.h"
#import <UMCommon/UMCommon.h>

@implementation HTUMManager

+ (void)initUMSDKWithAppKey:(NSString *)key
{
    [UMConfigure initWithAppkey:key channel:@"App Store"];
}

@end
