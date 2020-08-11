//
//  HTRewardVideoAdManager.m
//  HTAdSDK
//
//  Created by vitas on 2020/8/10.
//

#import "HTRewardVideoAdManager.h"
#import "HTAdDefine.h"

@interface HTRewardVideoAdManager ()

// 记录当前队列中显示的广告索引
@property (nonatomic, assign) NSInteger preShowIndex;

@property (nonatomic, strong) NSMutableArray *adQueue;

@end

@implementation HTRewardVideoAdManager

+ (void)shareInstance
{
    static dispatch_once_t onceToken;
    static HTRewardVideoAdManager *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [[HTRewardVideoAdManager alloc] init];
    });
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.platformPriority = @[@(kVendorAdPlatformCSJ), @(kVendorAdPlatformGDT), @(kVendorAdPlatformBD)];
        self.preShowIndex = 0;
    }
    return self;
}

- (void)initAdQueue
{
    for (NSNumber *platform in self.platformPriority) {
        
        HTRewardVideoAdItem *item = [[HTRewardVideoAdItem alloc] init];
        item.appId = self.appId;
        item.csjSlotId = self.csjSlotId;
        item.gdtSlotId = self.gdtSlotId;
        item.bdSlotId = self.bdSlotId;
        
        if ([platform integerValue] == kVendorAdPlatformCSJ) {
            item.platform = kVendorAdPlatformCSJ;
        } else if ([platform integerValue] == kVendorAdPlatformGDT) {
            item.platform = kVendorAdPlatformGDT;
        } else if ([platform integerValue] == kVendorAdPlatformBD) {
            item.platform = kVendorAdPlatformBD;
        } else {
            break;
        }
        [item loadData];
        
        [self.adQueue addObject:item];
    }
}

- (HTRewardVideoAdItem *)getValidAdData
{
    HTRewardVideoAdItem *_tempItem = nil;
    
    for (HTRewardVideoAdItem *item in self.adQueue) {
        if (item.isAdValid) {
            _tempItem = item;
            break;
        } else if (item.checkValidCount > 3) {
            
        }
    }
    return _tempItem;
}

#pragma mark - getter -

- (NSMutableArray *)adQueue
{
    if (!_adQueue) {
        _adQueue = [NSMutableArray array];
    }
    return _adQueue;
}

@end
