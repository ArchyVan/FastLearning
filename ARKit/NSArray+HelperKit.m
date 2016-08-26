//
//  NSArray+HelperKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "NSArray+HelperKit.h"

@implementation NSArray (HelperKit)

- (id)ar_objectAtIndex:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

- (BOOL)ar_isContainString:(NSString *)string
{
    for (NSString *element in self) {
        if ([element isKindOfClass:[NSString class]] && [element isEqualToString:string]) {
            return true;
        }
    }
    
    return false;
}

- (NSArray *)ar_reverseArray
{
    NSArray *arr = [[self reverseObjectEnumerator] allObjects];
    return arr;
}


@end
