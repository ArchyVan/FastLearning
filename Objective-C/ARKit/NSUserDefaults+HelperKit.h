//
//  NSUserDefaults+HelperKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (HelperKit)

/**
 *	Set safe object to the user defaults, it will filter all nil or Null object,
 *  to prevent app crashing.
 *
 *	@param value				The object to be saved.
 *	@param key          The only key.
 */
- (BOOL)ar_setSafeObject:(id)value forKey:(NSString *)key;

/**
 *  Set safe object to the user defaults, it will filter all nil or Null object.
 */
- (BOOL (^)(id value,NSString *key))setObjectForKey;

@end
