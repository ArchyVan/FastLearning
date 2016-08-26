//
//  UIGestureRecognizer+BlockKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "UIGestureRecognizer+BlockKit.h"
#import <objc/runtime.h>

static const void *s_ar_gestureKey = "s_ar_gestureKey";
static const void *s_ar_tap_gestureKey = "s_ar_tap_gestureKey";
static const void *s_ar_long_gestureKey = "s_ar_long_gestureKey";

@implementation UIGestureRecognizer (BlockKit)

- (ARGestureBlock)ar_onGesture {
    return objc_getAssociatedObject(self, s_ar_gestureKey);
}

- (void)setAr_onGesture:(ARGestureBlock)ar_onGesture {
    objc_setAssociatedObject(self,
                             s_ar_gestureKey,
                             ar_onGesture,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(ar_private_onGesture:)];
    
    if (ar_onGesture) {
        [self addTarget:self action:@selector(ar_private_onGesture:)];
    }
}

- (ARTapGestureBlock)ar_onTaped {
    return objc_getAssociatedObject(self, s_ar_tap_gestureKey);
}

- (void)setAr_onTaped:(ARTapGestureBlock)ar_onTaped {
    objc_setAssociatedObject(self,
                             s_ar_tap_gestureKey,
                             ar_onTaped,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(ar_private_onTaped:)];
    
    if (ar_onTaped) {
        [self addTarget:self action:@selector(ar_private_onTaped:)];
    }
}

- (ARLongGestureBlock)ar_onLongPressed {
    return objc_getAssociatedObject(self, s_ar_long_gestureKey);
}

- (void)setAr_onLongPressed:(ARLongGestureBlock)ar_onLongPressed {
    objc_setAssociatedObject(self,
                             s_ar_long_gestureKey,
                             ar_onLongPressed,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(ar_private_onLongPressed:)];
    
    if (ar_onLongPressed) {
        [self addTarget:self action:@selector(ar_private_onLongPressed:)];
    }
}

#pragma mark - Private
- (void)ar_private_onGesture:(UIGestureRecognizer *)sender {
    ARGestureBlock block = [self ar_onGesture];
    
    if (block) {
        block(sender);
    }
}

- (void)ar_private_onTaped:(UITapGestureRecognizer *)sender {
    ARTapGestureBlock block = [self ar_onTaped];
    
    if (block) {
        block(sender);
    }
}

- (void)ar_private_onLongPressed:(UILongPressGestureRecognizer *)sender {
    ARLongGestureBlock block = [self ar_onLongPressed];
    
    if (block) {
        block(sender);
    }
}


@end

