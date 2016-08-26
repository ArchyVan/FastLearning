//
//  NSUserDefaults+HelperKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "NSUserDefaults+HelperKit.h"
#import "NSObject+HelperKit.h"

@implementation NSUserDefaults (HelperKit)

- (BOOL)ar_setSafeObject:(id)value forKey:(NSString *)key {
    if (key == nil) {
        return NO;
    }
    
    if (value == nil || [value isKindOfClass:[NSNull class]]) {
        [self removeObjectForKey:key];
        
        return YES;
    }
    
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        [self setObject:value forKey:key];
        [self synchronize];
        return YES;
    } else {
        id result = [value ar_filterNullNil];
        if (result) {
            [self setObject:result forKey:key];
            [self synchronize];
            
            return YES;
        }
    }
    
    return NO;
}

@end
