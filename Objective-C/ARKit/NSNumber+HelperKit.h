//
//  NSNumber+HelperKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (HelperKit)

/**
 *	@author Archy Van
 *
 *	Convert NSNumber object to a string object.
 *
 *	@return A string.
 */
- (NSString *)ar_toString;

/**
 *	@author Archy Van
 *
 *	Convert NSNumber object to a micrometer string object.
 *
 *	@return A micrometer string.
 */
- (NSString *)ar_toMicrometerString;

@end
