//
//  UIView+ARUIKit.m
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "UIView+ARUIKit.h"

static BOOL circle = NO;

@implementation UIView (ARUIKit)

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

- (void)setAr_cornerRadius:(CGFloat)ar_cornerRadius {
    self.layer.cornerRadius = ar_cornerRadius;
}

- (CGFloat)ar_cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setAr_borderColor:(UIColor *)ar_borderColor {
    self.layer.borderColor = ar_borderColor.CGColor;
}

- (UIColor *)ar_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setAr_borderWidth:(CGFloat)ar_borderWidth {
    self.layer.borderWidth = ar_borderWidth;
}

- (CGFloat)ar_borderWidth {
    return self.layer.borderWidth;
}

- (void)setIsCircle:(BOOL)isCircle
{
    circle = isCircle;
    if (circle) {
        CGFloat w = MIN(self.ar_width, self.ar_height);
        self.ar_size = CGSizeMake(w, w);
        self.ar_cornerRadius = w / 2;
        self.clipsToBounds = YES;
    } else {
        self.clipsToBounds = NO;
    }
}

- (BOOL)isCircle
{
    return circle;
}


@end
