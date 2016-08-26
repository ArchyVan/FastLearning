//
//  UIControl+BlockKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "UIControl+BlockKit.h"
#import <objc/runtime.h>
static const void *s_ARButtonTouchUpKey = "s_ARButtonTouchUpKey";
static const void *s_ARButtonTouchDownKey = "s_ARButtonTouchDownKey";
static const void *s_AROnValueChangedKey = "s_AROnValueChangedKey";
static const void *s_AROnEditChangedKey = "s_AROnEditChangedKey";

@implementation UIControl (BlockKit)

- (ARButtonBlock)ar_onTouchUp {
    return objc_getAssociatedObject(self, s_ARButtonTouchUpKey);
}

- (void)setAr_onTouchUp:(ARButtonBlock)ar_onTouchUp {
    objc_setAssociatedObject(self, s_ARButtonTouchUpKey, ar_onTouchUp, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self
                action:@selector(ar_private_onTouchUp:)
      forControlEvents:UIControlEventTouchUpInside];
    
    if (ar_onTouchUp) {
        [self addTarget:self
                 action:@selector(ar_private_onTouchUp:)
       forControlEvents:UIControlEventTouchUpInside];
    }
}

- (ARButtonBlock)ar_onTouchDown {
    return objc_getAssociatedObject(self, s_ARButtonTouchDownKey);
}

- (void)setAr_onTouchDown:(ARButtonBlock)ar_onTouchDown {
    [self removeTarget:self
                action:@selector(ar_private_onTouchDown:)
      forControlEvents:UIControlEventTouchDown];
    
    if (ar_onTouchDown) {
        [self addTarget:self
                 action:@selector(ar_private_onTouchDown:)
       forControlEvents:UIControlEventTouchDown];
    }
    
    objc_setAssociatedObject(self,
                             s_ARButtonTouchDownKey,
                             ar_onTouchDown,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ARValueChangedBlock)ar_onValueChanged {
    return objc_getAssociatedObject(self, s_AROnValueChangedKey);
}

- (void)setAr_onValueChanged:(ARValueChangedBlock)ar_onValueChanged {
    objc_setAssociatedObject(self,
                             s_AROnValueChangedKey,
                             ar_onValueChanged,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self
                action:@selector(ar_private_onValueChanged:)
      forControlEvents:UIControlEventValueChanged];
    
    if (ar_onValueChanged) {
        [self addTarget:self
                 action:@selector(ar_private_onValueChanged:)
       forControlEvents:UIControlEventValueChanged];
    }
}

- (AREditChangedBlock)ar_onEditChanged {
    return objc_getAssociatedObject(self, s_AROnEditChangedKey);
}

- (void)setAr_onEditChanged:(AREditChangedBlock)ar_onEditChanged {
    objc_setAssociatedObject(self,
                             s_AROnEditChangedKey,
                             ar_onEditChanged,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self
                action:@selector(ar_private_onEditChanged:)
      forControlEvents:UIControlEventEditingChanged];
    
    if (ar_onEditChanged) {
        [self addTarget:self
                 action:@selector(ar_private_onEditChanged:)
       forControlEvents:UIControlEventEditingChanged];
    }
}

#pragma mark - Private
- (void)ar_private_onTouchUp:(id)sender {
    ARButtonBlock block = [self ar_onTouchUp];
    
    if (block) {
        block(sender);
    }
}

- (void)ar_private_onTouchDown:(id)sender {
    ARButtonBlock block = [self ar_onTouchDown];
    
    if (block) {
        block(sender);
    }
}

- (void)ar_private_onValueChanged:(id)sender {
    ARValueChangedBlock block = [self ar_onValueChanged];
    
    if (block) {
        block(sender);
    }
}

- (void)ar_private_onEditChanged:(id)sender {
    AREditChangedBlock block = [self ar_onEditChanged];
    
    if (block) {
        block(sender);
    }
}

@end
