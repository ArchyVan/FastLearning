//
//  NSFileManager+HelperKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (HelperKit)

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Judge whether file at path exists and check time out or not.
 *
 *	@param filePath	The file absolute path
 *	@param timeout	The specified time out.
 *
 *	@return NO if file exists and hasn't exceeded the specified time, otherwise YES.
 */
- (BOOL)ar_isFileAtPath:(NSString *)filePath hasTimeOut:(NSTimeInterval)timeout;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get attributes of file at path.
 *
 *	@param path	The file path
 *
 *	@return The file attributes if file exists, otherwise nil.
 */
- (NSDictionary *)ar_fileAttributesAtPath:(NSString *)path;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Get file size at path
 *
 *	@param path	The file path
 *
 *	@return File real size at path, or 0 if file doesn't exist.
 */
- (unsigned long long)ar_fileSizeAtPath:(NSString *)path;

@end
