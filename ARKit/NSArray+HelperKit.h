//
//  NSArray+HelperKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HelperKit)

/**
 *  It is safe to call this method to retrieve element.
 *
 *	@param index	The index.
 *
 *	@return The element in the index if index is valid, otherwise nil.
 */
- (id)ar_objectAtIndex:(NSUInteger)index;

/**
 *	Judge whether the array contains the string.
 *
 *	@param object	The specified string to be checked.
 *
 *	@return YES if found, otherwise NO.
 */
- (BOOL)ar_isContainString:(NSString *)string;

/**
 *	Make the array elements reverse.
 *
 *	@return The reversed array.
 */
- (NSArray *)ar_reverseArray;

@end
