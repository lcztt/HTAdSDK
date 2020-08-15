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

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    static HTRewardVideoAdManager *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [[HTRewardVideoAdManager alloc] init];
    });
    return _instance;
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
    [self.adQueue removeAllObjects];
    self.preShowIndex = 0;
    
    for (NSNumber *platform in self.platformPriority) {
        
        HTRewardVideoAdItem *item = [[HTRewardVideoAdItem alloc] init];
        if ([platform integerValue] == kVendorAdPlatformCSJ) {
            item.platform = kVendorAdPlatformCSJ;
        } else if ([platform integerValue] == kVendorAdPlatformGDT) {
            item.platform = kVendorAdPlatformGDT;
        } else if ([platform integerValue] == kVendorAdPlatformBD) {
            item.platform = kVendorAdPlatformBD;
        } else {
            continue;
        }
        
        item.bdAppId = self.bdAppId;
        item.csjSlotId = self.csjSlotId;
        item.gdtSlotId = self.gdtSlotId;
        item.bdSlotId = self.bdSlotId;
        [item loadData];
        [self.adQueue addObject:item];
    }
}

- (HTRewardVideoAdItem *)getValidAdData
{
    NSInteger index = self.preShowIndex % self.adQueue.count;
    HTRewardVideoAdItem *adItem = self.adQueue[index];
    
    HTRewardVideoAdItem *item = [[HTRewardVideoAdItem alloc] init];
    item.bdAppId = self.bdAppId;
    item.csjSlotId = self.csjSlotId;
    item.gdtSlotId = self.gdtSlotId;
    item.bdSlotId = self.bdSlotId;
    item.platform = adItem.platform;
    [item loadData];
    [self.adQueue replaceObjectAtIndex:index withObject:item];
    
    self.preShowIndex++;
    return adItem;
    
//    if (adItem.isAdValid) {
//        HTRewardVideoAdItem *item = [[HTRewardVideoAdItem alloc] init];
//        item.bdAppId = self.bdAppId;
//        item.csjSlotId = self.csjSlotId;
//        item.gdtSlotId = self.gdtSlotId;
//        item.bdSlotId = self.bdSlotId;
//        item.platform = adItem.platform;
//        [item loadData];
//        [self.adQueue replaceObjectAtIndex:index withObject:item];
//
//        self.preShowIndex++;
//        return adItem;
//    }
//
//    if (adItem.checkValidCount >= 3) {
//
//
//        self.preShowIndex++;
//    }
//
//    return nil;
    
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
