//
//  NSTimer+HelperKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ARTimerCallback)(NSTimer *timer);

@interface NSTimer (HelperKit)

/**
 *	Create a timer with time interval, repeat or not, and callback.
 *
 *	@param interval	Time interval
 *	@param repeats	Whether repeat to schedule.
 *	@param callback The callback block.
 *
 *	@return Timer object.
 */
+ (NSTimer *)ar_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                        repeats:(BOOL)repeats
                                       callback:(ARTimerCallback)callback;

/**
 *	Create a timer with time interval, repeat count, and callback.
 *
 *	@param interval	Time interval
 *	@param count		When count <= 0, it means repeat.
 *	@param callback	The callback block
 *
 *	@return Timer object
 */
+ (NSTimer *)ar_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          count:(NSInteger)count
                                       callback:(ARTimerCallback)callback;

/**
 *	Start timer immediately.
 */
- (void)ar_fireTimer;

/**
 *	Pause timer immediately
 */
- (void)ar_unfireTimer;

/**
 *	Make timer invalidate.
 */
- (void)ar_invalidate;


@end
