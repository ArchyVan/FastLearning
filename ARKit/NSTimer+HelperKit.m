//
//  NSTimer+HelperKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "NSTimer+HelperKit.h"
#import <objc/runtime.h>

static const void *s_ar_private_currentCountTime = "s_ar_private_currentCountTime";

@implementation NSTimer (HelperKit)

- (NSNumber *)ar_private_currentCountTime {
    NSNumber *obj = objc_getAssociatedObject(self, s_ar_private_currentCountTime);
    
    if (obj == nil) {
        obj = @(0);
        
        [self setHyb_private_currentCountTime:obj];
    }
    
    return obj;
}

- (void)setHyb_private_currentCountTime:(NSNumber *)time {
    objc_setAssociatedObject(self,
                             s_ar_private_currentCountTime,
                             time, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSTimer *)ar_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          count:(NSInteger)count
                                       callback:(ARTimerCallback)callback {
    if (count <= 0) {
        return [self ar_scheduledTimerWithTimeInterval:interval
                                                repeats:YES
                                               callback:callback];
    }
    
    NSDictionary *userInfo = @{@"callback"     : callback,
                               @"count"        : @(count)};
    return [NSTimer scheduledTimerWithTimeInterval:interval
                                            target:self
                                          selector:@selector(ar_onTimerUpdateCountBlock:)
                                          userInfo:userInfo
                                           repeats:YES];
}

+ (NSTimer *)ar_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                        repeats:(BOOL)repeats
                                       callback:(ARTimerCallback)callback {
    return [NSTimer scheduledTimerWithTimeInterval:interval
                                            target:self
                                          selector:@selector(ar_onTimerUpdateBlock:)
                                          userInfo:callback
                                           repeats:repeats];
}

- (void)ar_fireTimer {
    [self setFireDate:[NSDate distantPast]];
}

- (void)ar_unfireTimer {
    [self setFireDate:[NSDate distantFuture]];
}

- (void)ar_invalidate {
    if (self.isValid) {
        [self invalidate];
    }
}

#pragma mark - Private
+ (void)ar_onTimerUpdateBlock:(NSTimer *)timer {
    ARTimerCallback block = timer.userInfo;
    
    if (block) {
        block(timer);
    }
}

+ (void)ar_onTimerUpdateCountBlock:(NSTimer *)timer {
    NSInteger currentCount = [[timer ar_private_currentCountTime] integerValue];
    
    NSDictionary *userInfo = timer.userInfo;
    ARTimerCallback callback = userInfo[@"callback"];
    NSNumber *count = userInfo[@"count"];
    
    if (currentCount < count.integerValue) {
        currentCount++;
        [timer setHyb_private_currentCountTime:@(currentCount)];
        
        if (callback) {
            callback(timer);
        }
    } else {
        currentCount = 0;
        [timer setHyb_private_currentCountTime:@(currentCount)];
        
        [timer ar_unfireTimer];
        [timer ar_invalidate];
    }
}


@end
