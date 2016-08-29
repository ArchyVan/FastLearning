//
//  NSDictionary+HelperKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "NSDictionary+HelperKit.h"

@implementation NSDictionary (HelperKit)

- (id)ar_objectForKey:(id<NSCopying>)key {
    if (key == nil) {
        return nil;
    }
    
    return [self objectForKey:key];
}

- (int)ar_intForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self ar_numberForKey:key];
    
    return [number intValue];
}

- (double)ar_doubleForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self ar_numberForKey:key];
    
    return [number doubleValue];
}

- (float)ar_floatForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self ar_numberForKey:key];
    
    return [number floatValue];
}

- (NSInteger)ar_integerForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self ar_numberForKey:key];
    
    return [number integerValue];
}

- (NSString *)ar_stringForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self ar_objectForKey:key];
    
    if ([obj isKindOfClass:[NSString class]]) {
        return (NSString *)obj;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@", obj];
    }
    
    return nil;
}


- (NSDictionary *)ar_dictionaryForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self ar_objectForKey:key];
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj;
    }
    
    return nil;
}

- (NSArray *)ar_arrayForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self ar_objectForKey:key];
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray *)obj;
    }
    
    return nil;
}

- (NSNumber *)ar_numberForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self ar_objectForKey:key];
    if ([obj isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)obj;
    }
    
    return nil;
}

- (BOOL)ar_boolForKey:(id)key {
    if (key == nil) {
        return NO;
    }
    
    id number = [self ar_objectForKey:key];
    if ([number respondsToSelector:@selector(boolValue)]) {
        return [number boolValue];
    }
    
    return NO;
}

- (unsigned long long)ar_unsignedLongLongValue:(id<NSCopying>)key {
    if (key == nil) {
        return 0;
    }
    
    id number = [self ar_objectForKey:key];
    if ([number respondsToSelector:@selector(unsignedLongLongValue)]) {
        return [number unsignedLongLongValue];
    }
    
    return 0;
}


@end
