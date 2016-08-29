//
//  ARRootViewController.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "ARRootViewController.h"
#import <objc/runtime.h>

@interface ARRootViewController ()

@property (nonatomic, strong) NSMutableArray *ar_notificationNames;

@end

@implementation ARRootViewController

- (void)dealloc {
    [self ar_removeAllNotifications];
    
#if DEBUG
    NSLog(@"%@ dealloc", [[self class] description]);
#endif
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = kWhiteColor;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
#if DEBUG
    NSLog(@"%@ viewDidAppear", [[self class] description]);
#endif
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
#if DEBUG
    NSLog(@"%@ viewDidDisappear", [[self class] description]);
#endif
}


#pragma mark - Notification
- (void)ar_addObserverWithNotificationName:(NSString *)notificationName
                                   callback:(ARNotificationBlock)callback {
    if (kIsEmptyString(notificationName)) {
        return;
    }
    
    [self ar_addNotificationName:notificationName];
    
    [kNotificationCenter addObserver:self
                            selector:@selector(ar_onRecievedNotification:)
                                name:notificationName
                              object:nil];
    objc_setAssociatedObject(self,
                             (__bridge const void *)(notificationName),
                             callback,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)ar_removeAllNotifications {
    // 移除监听
    for (NSString *name in self.ar_notificationNames) {
        [kNotificationCenter removeObserver:self name:name object:nil];
        // 取消关联
        objc_setAssociatedObject(self,
                                 (__bridge const void *)(name),
                                 nil,
                                 OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    [kNotificationCenter removeObserver:self];
}

- (void)ar_removeAllNotificationWithName:(NSString *)nofiticationName {
    if (kIsEmptyString(nofiticationName)) {
        return;
    }
    
    // 移除监听
    for (NSString *name in self.ar_notificationNames) {
        if ([name isEqualToString:nofiticationName]) {
            [kNotificationCenter removeObserver:self name:name object:nil];
            // 取消关联
            objc_setAssociatedObject(self,
                                     (__bridge const void *)(name),
                                     nil,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
            break;
        }
    }
}

#pragma mark - Private

- (void)ar_addNotificationName:(NSString *)name {
    for (NSString *notificationName in self.ar_notificationNames) {
        if ([notificationName isEqualToString:name]) {
            return;
        }
    }
    
    [self.ar_notificationNames addObject:name];
}

- (void)ar_onRecievedNotification:(NSNotification *)notification {
    for (NSString *name in self.ar_notificationNames) {
        if ([name isEqualToString:notification.name]) {
            ARNotificationBlock block = objc_getAssociatedObject(self,
                                                                  (__bridge const void *)(notification.name));
            if (block) {
                block(notification);
            }
            
            break;
        }
    }
}

- (NSMutableArray *)ar_notificationNames {
    if (_ar_notificationNames == nil) {
        _ar_notificationNames = [[NSMutableArray alloc] init];
    }
    
    return _ar_notificationNames;
}


@end
