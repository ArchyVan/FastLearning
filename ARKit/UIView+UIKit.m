//
//  UIView+UIKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "UIView+UIKit.h"

@implementation UIView (UIKit)

- (void)setAr_origin:(CGPoint)ar_origin {
    CGRect frame = self.frame;
    frame.origin = ar_origin;
    self.frame = frame;
}

- (CGPoint)ar_origin {
    return self.frame.origin;
}

- (void)setAr_originX:(CGFloat)ar_originX {
    [self setAr_origin:CGPointMake(ar_originX, self.ar_originY)];
}

- (CGFloat)ar_originX {
    return self.ar_origin.x;
}

- (void)setAr_originY:(CGFloat)ar_originY {
    [self setAr_origin:CGPointMake(self.ar_originX, ar_originY)];
}

- (CGFloat)ar_originY {
    return self.ar_origin.y;
}

- (void)setAr_center:(CGPoint)ar_center {
    self.center = ar_center;
}

- (CGPoint)ar_center {
    return self.center;
}

- (void)setAr_centerX:(CGFloat)ar_centerX {
    [self setAr_center:CGPointMake(ar_centerX, self.ar_centerY)];
}

- (CGFloat)ar_centerX {
    return self.ar_center.x;
}

- (void)setAr_centerY:(CGFloat)ar_centerY {
    [self setAr_center:CGPointMake(self.ar_centerX, ar_centerY)];
}

- (CGFloat)ar_centerY {
    return self.ar_center.y;
}

- (void)setAr_size:(CGSize)ar_size {
    CGRect frame = self.frame;
    frame.size = ar_size;
    self.frame = frame;
}

- (CGSize)ar_size {
    return self.frame.size;
}

- (void)setAr_width:(CGFloat)ar_width {
    self.ar_size = CGSizeMake(ar_width, self.ar_height);
}

- (CGFloat)ar_width {
    return self.ar_size.width;
}

- (void)setAr_height:(CGFloat)ar_height {
    self.ar_size = CGSizeMake(self.ar_width, ar_height);
}

- (CGFloat)ar_height {
    return self.ar_size.height;
}

- (CGFloat)ar_left {
    return self.frame.origin.x;
}

- (void)setAr_left:(CGFloat)ar_left {
    CGRect frame = self.frame;
    frame.origin.x = ar_left;
    self.frame = frame;
}

- (CGFloat)ar_top {
    return self.frame.origin.y;
}

- (void)setAr_top:(CGFloat)ar_top {
    CGRect frame = self.frame;
    frame.origin.y = ar_top;
    self.frame = frame;
}

- (CGFloat)ar_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setAr_right:(CGFloat)ar_right {
    CGRect frame = self.frame;
    frame.origin.x = ar_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)ar_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setAr_bottom:(CGFloat)ar_bottom {
    CGRect frame = self.frame;
    frame.origin.y = ar_bottom - frame.size.height;
    self.frame = frame;
}


@end
