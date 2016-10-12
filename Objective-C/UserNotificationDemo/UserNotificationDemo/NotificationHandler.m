//
//  NotificationHandler.m
//  UserNotificationDemo
//
//  Created by Objective-C on 2016/10/11.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "NotificationHandler.h"

@implementation NotificationHandler

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    NSLog(@"\n------------------------------");
    completionHandler(UNNotificationPresentationOptionSound);
    completionHandler(UNNotificationPresentationOptionAlert);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
{
    NSString *category = response.notification.request.content.categoryIdentifier;
    if ([category isEqualToString:@"saySomething"]) {
        [self _handleSaySomething:response];
    } else if ([category isEqualToString:@"customUI"]) {
        [self _handleCustomUI:response];
    }
    completionHandler();
}

- (void)_handleSaySomething:(UNNotificationResponse *)response
{
    NSString *text = @"";
    NSString *actionType = response.actionIdentifier;
    if ([actionType isEqualToString:@"input"]) {
        text = ((UNTextInputNotificationResponse *)response).userText;
    } else if ([actionType isEqualToString:@"goodbye"]) {
        text = @"Goodbye";
    } else if ([actionType isEqualToString:@"none"]) {
        text = @"";
    }
    
    NSLog(@"You just said%@",text);
}

- (void)_handleCustomUI:(UNNotificationResponse *)response
{
    NSLog(@"%@",response.actionIdentifier);
}

@end
