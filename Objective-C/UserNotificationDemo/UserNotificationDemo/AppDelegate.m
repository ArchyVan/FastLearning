//
//  AppDelegate.m
//  UserNotificationDemo
//
//  Created by Objective-C on 2016/10/10.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import "AppDelegate.h"
#import "NotificationHandler.h"

static NSString *receivedRemote = @"com.archy.usernotification.AppDidReceivedRemoteNotificationDeviceToken";

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self _registerNotificationCategory];
    [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *tokenString = [[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]
                              stringByReplacingOccurrencesOfString: @">" withString: @""]
                             stringByReplacingOccurrencesOfString: @" " withString: @""];
    [[NSUserDefaults standardUserDefaults] setObject:tokenString forKey:@"push-token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:receivedRemote object:nil userInfo:@{@"token":tokenString}];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"push-token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)_registerNotificationCategory
{
    UNTextInputNotificationAction *inputAction = [UNTextInputNotificationAction actionWithIdentifier:@"input" title:@"Input" options:UNNotificationActionOptionForeground textInputButtonTitle:@"Send" textInputPlaceholder:@"What do you want to say......"];
    
    UNNotificationAction *goodbyeAction = [UNNotificationAction actionWithIdentifier:@"goodbye" title:@"Goodbye" options:UNNotificationActionOptionForeground];
    
    UNNotificationAction *cancelAction = [UNNotificationAction actionWithIdentifier:@"none" title:@"Cancel" options:UNNotificationActionOptionDestructive];
    
    UNNotificationAction *nextAction = [UNNotificationAction actionWithIdentifier:@"switch" title:@"Switch" options:UNNotificationActionOptionNone];
    
    UNNotificationAction *openAction = [UNNotificationAction actionWithIdentifier:@"open" title:@"Open" options:UNNotificationActionOptionNone];
    
    UNNotificationAction *dismissAction = [UNNotificationAction actionWithIdentifier:@"dismiss" title:@"Dismiss" options:UNNotificationActionOptionDestructive];
    
    UNNotificationCategory *saySomethingCategory = [UNNotificationCategory categoryWithIdentifier:@"saySomething" actions:@[inputAction,goodbyeAction,cancelAction] intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
    
    UNNotificationCategory *customUICategory = [UNNotificationCategory categoryWithIdentifier:@"customUI" actions:@[nextAction, openAction, dismissAction] intentIdentifiers:@[] options:UNNotificationCategoryOptionNone];
    
    [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:[NSSet setWithArray:@[saySomethingCategory,customUICategory]]];
    
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    NSLog(@"\n------------------------------");
    completionHandler(UNNotificationPresentationOptionAlert);
    completionHandler(UNNotificationPresentationOptionSound);
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

