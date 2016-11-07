//
//  UIView+LayoutMethods.m
//  UIKit
//
//  Created by Objective-C on 2016/11/2.
//  Copyright © 2016年 Archy Van. All rights reserved.
//

#import "UIView+LayoutMethods.h"

@implementation UIView (LayoutMethods)

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

- (void)ar_heightEqualToView:(UIView *)view
{
    self.ar_height = view.ar_height;
}

- (void)ar_widthEqualToView:(UIView *)view
{
    self.ar_width = view.ar_width;
}

- (void)ar_centerXEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.ar_topSuperView];
    CGPoint centerPoint = [self.ar_topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.ar_centerX = centerPoint.x;
}

- (void)ar_centerYEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.ar_topSuperView];
    CGPoint centerPoint = [self.ar_topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.ar_centerY = centerPoint.y;
}

- (void)ar_centerEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.ar_topSuperView];
    CGPoint centerPoint = [self.ar_topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.ar_centerX = centerPoint.x;
    self.ar_centerY = centerPoint.y;
}

- (void)ar_topEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ar_origin toView:self.ar_topSuperView];
    CGPoint newOrigin = [self.ar_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ar_originY = newOrigin.y;
}
- (void)ar_bottomEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ar_origin toView:self.ar_topSuperView];
    CGPoint newOrigin = [self.ar_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ar_originY = newOrigin.y + view.ar_height - self.ar_height;
}

- (void)ar_leftEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ar_origin toView:self.ar_topSuperView];
    CGPoint newOrigin = [self.ar_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ar_originX = newOrigin.x;
}

- (void)ar_rightEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ar_origin toView:self.ar_topSuperView];
    CGPoint newOrigin = [self.ar_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ar_originX = newOrigin.x + view.ar_width - self.ar_width;
}

- (void)ar_sizeEqualToView:(UIView *)view
{
    self.frame = CGRectMake(self.ar_originX, self.ar_originY, view.ar_width, view.ar_height);
}

// top, bottom, left, right -- New Version
- (void)ar_fromTheTop:(CGFloat)distance ofView:(UIView *)view
{
    [self ar_bottom:distance fromView:view];
}

- (void)ar_fromTheBottom:(CGFloat)distance ofView:(UIView *)view
{
    [self ar_top:distance fromView:view];
}

- (void)ar_fromTheLeft:(CGFloat)distance ofView:(UIView *)view
{
    [self ar_left:distance fromView:view];
}

- (void)ar_fromTheRight:(CGFloat)distance ofView:(UIView *)view
{
    [self ar_right:distance fromView:view];
}


- (void)ar_fromTheRelativeTop:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self ar_bottomRatio:distance FromView:view screenType:screenType];
}

- (void)ar_fromTheRelativeBottom:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self ar_topRatio:distance FromView:view screenType:screenType];
}

- (void)ar_fromTheRelativeLeft:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self ar_leftRatio:distance FromView:view screenType:screenType];
}

- (void)ar_fromTheRelativeRight:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self ar_rightRatio:distance FromView:view screenType:screenType];
}


- (void)ar_relativeTopInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self ar_topRatioInContainer:top shouldResize:shouldResize screenType:screenType];
}

- (void)ar_relativeBottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self ar_bottomRatioInContainer:bottom shouldResize:shouldResize screenType:screenType];
}

- (void)ar_relativeLeftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self ar_leftRatioInContainer:left shouldResize:shouldResize screenType:screenType];
}

- (void)ar_relativeRightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self ar_rightRatioInContainer:right shouldResize:shouldResize screenType:screenType];
}

// top, bottom, left, right -- Old Version
- (void)ar_top:(CGFloat)top fromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ar_origin toView:self.ar_topSuperView];
    CGPoint newOrigin = [self.ar_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ar_originY = floorf(newOrigin.y + top + view.ar_height);
}

- (void)ar_bottom:(CGFloat)bottom fromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ar_origin toView:self.ar_topSuperView];
    CGPoint newOrigin = [self.ar_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ar_originY = newOrigin.y - bottom - self.ar_height;
}

- (void)ar_left:(CGFloat)left fromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ar_origin toView:self.ar_topSuperView];
    CGPoint newOrigin = [self.ar_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ar_originX = newOrigin.x - left - self.ar_width;
}

- (void)ar_right:(CGFloat)right fromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.ar_origin toView:self.ar_topSuperView];
    CGPoint newOrigin = [self.ar_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.ar_originX = newOrigin.x + right + view.ar_width;
}

- (void)ar_topRatio:(CGFloat)top FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat topRatio = top / screenType;
    CGFloat topValue = topRatio * self.superview.ar_width;
    [self ar_top:topValue fromView:view];
}

- (void)ar_bottomRatio:(CGFloat)bottom FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat bottomRatio = bottom / screenType;
    CGFloat bottomValue = bottomRatio * self.superview.ar_width;
    [self ar_bottom:bottomValue fromView:view];
}

- (void)ar_leftRatio:(CGFloat)left FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat leftRatio = left / screenType;
    CGFloat leftValue = leftRatio * self.superview.ar_width;
    [self ar_left:leftValue fromView:view];
}

- (void)ar_rightRatio:(CGFloat)right FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat rightRatio = right / screenType;
    CGFloat rightValue = rightRatio * self.superview.ar_width;
    [self ar_right:rightValue fromView:view];
}

- (void)ar_topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.ar_height = self.ar_originY - top + self.ar_height;
    }
    self.ar_originY = top;
}

- (void)ar_bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.ar_height = self.superview.ar_height - bottom - self.ar_originY;
    } else {
        self.ar_originY = self.superview.ar_height - self.ar_height - bottom;
    }
}

- (void)ar_leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.ar_width = self.ar_originX - left + self.superview.ar_width;
    }
    self.ar_originX = left;
}

- (void)ar_rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.ar_width = self.superview.ar_width - right - self.ar_originX;
    } else {
        self.ar_originX = self.superview.ar_width - self.ar_width - right;
    }
}

- (void)ar_topRatioInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat topRatio = top / screenType;
    CGFloat topValue = topRatio * self.superview.ar_width;
    [self ar_topInContainer:topValue shouldResize:shouldResize];
}

- (void)ar_bottomRatioInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat bottomRatio = bottom / screenType;
    CGFloat bottomValue = bottomRatio * self.superview.ar_width;
    [self ar_bottomInContainer:bottomValue shouldResize:shouldResize];
}

- (void)ar_leftRatioInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat leftRatio = left / screenType;
    CGFloat leftValue = leftRatio * self.superview.ar_width;
    [self ar_leftInContainer:leftValue shouldResize:shouldResize];
}

- (void)ar_rightRatioInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat rightRatio = right / screenType;
    CGFloat rightValue = rightRatio * self.superview.ar_width;
    [self ar_rightInContainer:rightValue shouldResize:shouldResize];
}

- (void)ar_fillWidth
{
    self.ar_width = self.superview.ar_width;
    [self ar_centerXEqualToView:self.superview];
}

- (void)ar_fillHeight
{
    self.ar_height = self.superview.ar_height;
    [self ar_centerYEqualToView:self.superview];
}

- (void)ar_fill
{
    self.frame = CGRectMake(0, 0, self.superview.ar_width, self.superview.ar_height);
}

- (UIView *)ar_topSuperView
{
    UIView *topSuperView = self.superview;
    
    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    
    return topSuperView;
}


@end
