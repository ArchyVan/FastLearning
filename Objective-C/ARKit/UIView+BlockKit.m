//
//  UIView+BlockKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "UIView+BlockKit.h"
#import "UIGestureRecognizer+BlockKit.h"
#import <objc/runtime.h>

static const void *s_ar_tapGestureKey = "s_ar_tapGestureKey";
static const void *s_ar_longGestureKey = "s_ar_longGestureKey";

@implementation UIView (BlockKit)

- (UITapGestureRecognizer *)ar_tapGesture {
    return objc_getAssociatedObject(self, s_ar_tapGestureKey);
}

- (UILongPressGestureRecognizer *)ar_longGesure {
    return objc_getAssociatedObject(self, s_ar_longGestureKey);
}

- (void)ar_addTapGestureWithCallback:(ARTapGestureBlock)onTaped {
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.ar_onTaped = onTaped;
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self,
                             s_ar_tapGestureKey,
                             tap,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)ar_addLongGestureWithCallback:(ARLongGestureBlock)onLongPressed {
    self.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] init];
    gesture.ar_onLongPressed = onLongPressed;
    [self addGestureRecognizer:gesture];
    
    objc_setAssociatedObject(self,
                             s_ar_longGestureKey,
                             gesture,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
