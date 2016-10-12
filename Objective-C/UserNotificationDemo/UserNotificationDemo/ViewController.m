//
//  ViewController.m
//  UserNotificationDemo
//
//  Created by Objective-C on 2016/10/10.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()
@property (strong, nonatomic) UNNotificationSettings *settings;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self _requestForAuthorization];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self _sendNotification];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
            NSLog(@"Authorization");
        }
        self.settings = settings;
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue:%@",segue.identifier);
}

- (void)_requestForAuthorization
{
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            [[UIApplication sharedApplication] registerForRemoteNotifications];
        } else {
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}

- (void)_sendNotification
{
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"Test Notification";
    content.body = @"My first notification";
    content.categoryIdentifier = @"saySomething";
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
    
    NSString *requestIdentifier = @"test";
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error : %@",error.description);
        }
    }];
}



@end
