//
//  NSDictionary+HelperKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HelperKit)

/**
 *	@author Archy Van
 *
 *  Get object from dictionary by key.
 *
 *	@param key	key
 *
 *	@return object of key, or nil if key doesn't exist
 */
- (id)ar_objectForKey:(id<NSCopying>)key;

/**
 *	@author Archy Van
 *
 *  Get int value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return int value of key, or zero if key doesn't exist
 */
- (int)ar_intForKey:(id<NSCopying>)key;

/**
 *	@author Archy Van
 *
 *  Get double value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return double value of key, or zero if key doesn't exist
 */
- (double)ar_doubleForKey:(id<NSCopying>)key;

/**
 *	@author Archy Van
 *
 *  Get float value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return float value of key, or zero if key doesn't exist
 */
- (float)ar_floatForKey:(id<NSCopying>)key;

/**
 *	@author Archy Van
 *
 *  Get NSInteger value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSInteger value of key, or zero if key doesn't exist
 */
- (NSInteger)ar_integerForKey:(id<NSCopying>)key;

/**
 *	@author Archy Van
 *
 *  Get NSString value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSString value of key, or nil if key doesn't exist
 */
- (NSString *)ar_stringForKey:(id<NSCopying>)key;

/**
 *	@author Archy Van
 *
 *  Get NSDictionary value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSDictionary value of key, or nil if key doesn't exist
 */
- (NSDictionary *)ar_dictionaryForKey:(id<NSCopying>)key;

/**
 *	@author Archy Van
 *
 *  Get NSArray value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSArray value of key, or nil if key doesn't exist
 */
- (NSArray *)ar_arrayForKey:(id<NSCopying>)key;

/**
 *	@author Archy Van
 *
 *  Get NSNumber value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSNumber value of key, or nil if key doesn't exist
 */
- (NSNumber *)ar_numberForKey:(id<NSCopying>)key;

/**
 *	@author Archy Van
 *
 *  Get BOOL value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return BOOL value of key, or false if key doesn't exist
 */
- (BOOL)ar_boolForKey:(id<NSCopying>)key;

/**
 *	@author Archy Van
 *
 *	Get the unsigned long long value form dict by key.
 *
 *	@param key	The key
 *
 *	@return unsigned long long value of key, or 0 if key doesn't exist.
 */
- (unsigned long long)ar_unsignedLongLongValue:(id<NSCopying>)key;


@end
