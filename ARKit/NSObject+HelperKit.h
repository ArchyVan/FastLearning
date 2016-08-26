//
//  NSObject+HelperKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HelperKit)

/**
 *	Get the name of currnet object's class.
 */
- (NSString *)ar_className;

#pragma mark - Json to object and object to jason
/**
 *	Transform an object to json data.
 *
 *	@param object	Any kind of object.
 *
 *	@return json data object if transform successfully, otherwise return nil.
 */
+ (NSMutableData *)ar_toJsonDataWithObject:(id)object;

/**
 *	Transform self to json data.
 *
 *	@return json data if transform successfully, otherwise return nil.
 */
- (NSMutableData *)ar_toJsonData;

/**
 *	Transform an object to json string.
 *
 *	@param object	Any kind of object
 *
 *	@return json string if transform successfully, otherwise return nil.
 */
+ (NSString *)ar_toJsonStringWithObject:(id)object;

/**
 *	Transform self to json string.
 *
 *	@return json string if transform successfully, otherwise return nil.
 */
- (NSString *)ar_toJsonString;

#pragma mark - Filter Null and nil
/**
 *	Filter all nil and null object.
 */
- (id)ar_filterNullNil;

/**
 *	Filter all nil and null object.
 *
 *	@param object	The object to be filtered.
 */
+ (id)ar_filterNullNilFromObject:(id)object;


@end
