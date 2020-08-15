//
//  HTRewardVideoAdManager.h
//  HTAdSDK
//
//  Created by vitas on 2020/8/10.
//

#import <Foundation/Foundation.h>
#import "HTRewardVideoAdItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTRewardVideoAdManager : NSObject

+ (instancetype)shareInstance;

@property (nonatomic, copy) NSString *csjSlotId;
@property (nonatomic, copy) NSString *gdtSlotId;

@property (nonatomic, copy) NSString *bdAppId;
@property (nonatomic, copy) NSString *bdSlotId;

// 平台优先级，默认是：scj,gdt,bd
@property (nonatomic, strong) NSArray *platformPriority;

// 初始化广告队列
- (void)initAdQueue;

- (HTRewardVideoAdItem *)getValidAdData;

@end

NS_ASSUME_NONNULL_END
