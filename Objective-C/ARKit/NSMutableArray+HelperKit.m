//
//  NSMutableArray+HelperKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "NSMutableArray+HelperKit.h"

@implementation NSMutableArray (HelperKit)

- (BOOL)ar_addObject:(id)object {
    BOOL ret = NO;
    if (object) {
        ret = YES;
        [self addObject:object];
    }
    
    return ret;
}

- (BOOL)ar_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil|| index > [self count] ) {
        return NO;
    }
    
    if ([self containsObject:anObject]) {
        return NO;
    }
    
    [self insertObject:anObject atIndex:index];
    
    return YES;
}

- (BOOL)ar_removeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return NO;
    }
    
    [self removeObjectAtIndex:index];
    
    return YES;
}

- (BOOL)ar_exchangeObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if ([self count] != 0 && toIndex != fromIndex
        && fromIndex < [self count] && toIndex < [self count]) {
        [self exchangeObjectAtIndex:fromIndex withObjectAtIndex:toIndex];
        
        return YES;
    }
    
    return NO;
}

- (BOOL (^)(id))addObject
{
    return ^(id object){
        return [self ar_addObject:object];
    };
}

@end
