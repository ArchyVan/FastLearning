//
//  ARRootViewController.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARKit.h"

@interface ARRootViewController : UIViewController

#pragma mark - Notification
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Add a notification to the notification center with notification name.
 *
 *	@param notificationName	The name of notification
 *	@param callback					The callback when received the notification.
 */
- (void)ar_addObserverWithNotificationName:(NSString *)notificationName
                                   callback:(ARNotificationBlock)callback;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Remove all notifications of the view controller.
 */
- (void)ar_removeAllNotifications;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Remove the specified notification with notification name from notification
 *  center.
 *
 *	@param nofiticationName	The notification name.
 */
- (void)ar_removeAllNotificationWithName:(NSString *)nofiticationName;


@end
