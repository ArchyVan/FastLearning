//
//  NSMutableDictionary+HelperKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "NSMutableDictionary+HelperKit.h"

@implementation NSMutableDictionary (HelperKit)

- (BOOL)ar_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (aKey == nil || anObject == nil) {
        return NO;
    }
    
    [self setObject:anObject forKey:aKey];
    
    return YES;
}

- (BOOL)ar_setValue:(id)value forKey:(NSString *)key {
    if (key == nil || value == nil) {
        return NO;
    }
    
    [self setValue:value forKey:key];
    
    return YES;
}


@end
