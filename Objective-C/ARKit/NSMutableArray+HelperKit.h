//
//  NSMutableArray+HelperKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (HelperKit)

/**
 *	It is more safe to add object to the array.
 *
 *	@param object	The object to be added.
 *
 *	@return YES if object can be added, otherwise NO.
 */
- (BOOL)ar_addObject:(id)object;

/**
 *	It is more safe to insert object to the array.
 *
 *	@param anObject	The object to be inserted.
 *	@param index		Index.
 *
 *	@return YES if inserted successfully, otherwise NO.
 */
- (BOOL)ar_insertObject:(id)anObject atIndex:(NSUInteger)index;

/**
 *	It it safe to remove object from the array.
 *
 *	@param index	The index
 *
 *	@return YES if remove successfully, otherwise NO.
 */
- (BOOL)ar_removeObjectAtIndex:(NSUInteger)index;

/**
 *  Exchange double elements.
 *
 *  @param fromIndex The index to move from
 *  @param toIndex   The index to move to
 *
 *  @return YES if exchange successfully, otherwise NO.
 */
- (BOOL)ar_exchangeObjectFromIndex:(NSUInteger)fromIndex
                            toIndex:(NSUInteger)toIndex;

/**
 *  Add object to the array
 */
- (BOOL (^)(id object))addObject;

@end
