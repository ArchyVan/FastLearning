//
//  UIDevice+ARUIKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (ARUIKit)
/**
 *  Return the device platform string
 *  Example: "iPhone3,2"
 *
 *  @return Return the device platform string
 */
+ (NSString *)ar_devicePlatform;

/**
 *  Return the user-friendly device platform string
 *  Example: "iPad Air (Cellular)"
 *
 *  @return Return the user-friendly device platform string
 */
+ (NSString *)ar_devicePlatformString;

/**
 *  Check if the current device is an iPad
 *
 *  @return Return YES if it's an iPad, NO if not
 */
+ (BOOL)ar_isiPad;

/**
 *  Check if the current device is an iPhone
 *
 *  @return Return YES if it's an iPhone, NO if not
 */
+ (BOOL)ar_isiPhone;

/**
 *  Check if the current device is an iPod
 *
 *  @return Return YES if it's an iPod, NO if not
 */
+ (BOOL)ar_isiPod;

/**
 *  Check if the current device is the simulator
 *
 *  @return Return YES if it's the simulator, NO if not
 */
+ (BOOL)ar_isSimulator;

/**
 *  Check if the current device has a Retina display
 *
 *  @return Return YES if it has a Retina display, NO if not
 */
+ (BOOL)ar_isRetina;

/**
 *  Check if the current device has a Retina HD display
 *
 *  @return Return YES if it has a Retina HD display, NO if not
 */
+ (BOOL)ar_isRetinaHD;

/**
 *  Return the iOS version without the subversion
 *  Example: 7
 *
 *  @return Return the iOS version
 */
+ (NSInteger)ar_iOSVersion;

/**
 *  Return the current device CPU frequency
 *
 *  @return Return the current device CPU frequency
 */
+ (NSUInteger)ar_cpuFrequency;

/**
 *  Return the current device BUS frequency
 *
 *  @return Return the current device BUS frequency
 */
+ (NSUInteger)ar_busFrequency;

/**
 *  Return the current device RAM size
 *
 *  @return Return the current device RAM size
 */
+ (NSUInteger)ar_ramSize;

/**
 *  Return the current device CPU number
 *
 *  @return Return the current device CPU number
 */
+ (NSUInteger)ar_cpuNumber;

/**
 *  Return the current device total memory
 *
 *  @return Return the current device total memory
 */
+ (NSUInteger)ar_totalMemory;

/**
 *  Return the current device non-kernel memory
 *
 *  @return Return the current device non-kernel memory
 */
+ (NSUInteger)ar_userMemory;

/**
 *  Return the current device total disk space
 *
 *  @return Return the current device total disk space
 */
+ (NSNumber *)ar_totalDiskSpace;

/**
 *  Return the current device free disk space
 *
 *  @return Return the current device free disk space
 */
+ (NSNumber *)ar_freeDiskSpace;

/**
 *  Return the current device MAC address
 *
 *  @return Return the current device MAC address
 */
+ (NSString *)ar_macAddress;

/**
 *  Generate an unique identifier and store it into standardUserDefaults
 *
 *  @return Return a unique identifier as a NSString
 */
+ (NSString *)ar_uniqueIdentifier;

@end
