//
//  NSMutableDictionary+HelperKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (HelperKit)

/**
 *	@author Archy Van
 *
 *	It is safe to use it to set object for key.
 *
 *	@param anObject	Object to be set.
 *	@param aKey			The unique key of key-value
 *
 *	@return YES if set object successfully, otherwise NO.
 */
- (BOOL)ar_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 *	@author Archy Van
 *
 *	It is safe to use it to set value for key.
 *
 *	@param value Value to be set.
 *	@param key	 The unique key of key-value.
 *
 *  @return YES if set value successfully, otherwise NO.
 */
- (BOOL)ar_setValue:(id)value forKey:(NSString *)key;


@end
