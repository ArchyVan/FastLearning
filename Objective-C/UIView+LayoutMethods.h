//
//  UIView+LayoutMethods.h
//  UIKit
//
//  Created by Objective-C on 2016/11/2.
//  Copyright © 2016年 Archy Van. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
#define SCREEN_WITHOUT_STATUS_HEIGHT (SCREEN_HEIGHT - [[UIApplication sharedApplication] statusBarFrame].size.height)
#define SCREEN_STATUS_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)

typedef CGFloat UIScreenType;

static UIScreenType UIScreenType_iPhone5 = 320.0f;
static UIScreenType UIScreenType_iPhone6 = 375.0f;
static UIScreenType UIScreenType_iPhone6P = 414.0f;

@interface UIView (LayoutMethods)

@property (nonatomic, assign) CGPoint ar_origin;
@property (nonatomic, assign) CGFloat ar_originX;
@property (nonatomic, assign) CGFloat ar_originY;
@property (nonatomic, assign) CGFloat ar_centerX;
@property (nonatomic, assign) CGFloat ar_centerY;
@property (nonatomic, assign) CGPoint ar_center;
@property (nonatomic, assign) CGFloat ar_width;
@property (nonatomic, assign) CGFloat ar_height;
@property (nonatomic, assign) CGSize  ar_size;
@property (nonatomic, assign) CGFloat ar_left;
@property (nonatomic, assign) CGFloat ar_top;
@property (nonatomic, assign) CGFloat ar_right;
@property (nonatomic, assign) CGFloat ar_bottom;
@property (nonatomic, assign) CGFloat ar_cornerRadius;
@property (nonatomic, assign) CGFloat ar_borderWidth;
@property (nonatomic, strong) UIColor *ar_borderColor;
- (void)ar_heightEqualToView:(UIView *)view;
- (void)ar_widthEqualToView:(UIView *)view;
- (void)ar_sizeEqualToView:(UIView *)view;
- (void)ar_centerXEqualToView:(UIView *)view;
- (void)ar_centerYEqualToView:(UIView *)view;
- (void)ar_centerEqualToView:(UIView *)view;
- (void)ar_topEqualToView:(UIView *)view;
- (void)ar_bottomEqualToView:(UIView *)view;
- (void)ar_leftEqualToView:(UIView *)view;
- (void)ar_rightEqualToView:(UIView *)view;



// top , bottom , left , right -- New Version

- (void)ar_fromTheTop:(CGFloat)distance ofView:(UIView *)view;
- (void)ar_fromTheBottom:(CGFloat)distance ofView:(UIView *)view;
- (void)ar_fromTheLeft:(CGFloat)distance ofView:(UIView *)view;
- (void)ar_fromTheRight:(CGFloat)distance ofView:(UIView *)view;

- (void)ar_fromTheRelativeTop:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType;
- (void)ar_fromTheRelativeBottom:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType;
- (void)ar_fromTheRelativeLeft:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType;
- (void)ar_fromTheRelativeRight:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType;

- (void)ar_relativeTopInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;
- (void)ar_relativeBottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;
- (void)ar_relativeLeftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;
- (void)ar_relativeRightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;

// top , bottom , left , right -- Old Version
- (void)ar_top:(CGFloat)top fromView:(UIView *)view;
- (void)ar_bottom:(CGFloat)bottom fromView:(UIView *)view;
- (void)ar_left:(CGFloat)left fromView:(UIView *)view;
- (void)ar_right:(CGFloat)right fromView:(UIView *)view;

- (void)ar_topRatio:(CGFloat)top FromView:(UIView *)view screenType:(UIScreenType)screenType;
- (void)ar_bottomRatio:(CGFloat)bottom FromView:(UIView *)view screenType:(UIScreenType)screenType;
- (void)ar_leftRatio:(CGFloat)left FromView:(UIView *)view screenType:(UIScreenType)screenType;
- (void)ar_rightRatio:(CGFloat)right FromView:(UIView *)view screenType:(UIScreenType)screenType;

- (void)ar_topRatioInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;
- (void)ar_bottomRatioInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;
- (void)ar_leftRatioInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;
- (void)ar_rightRatioInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType;


- (UIView *)ar_topSuperView;

- (void)ar_fillWidth;
- (void)ar_fillHeight;
- (void)ar_fill;

@end
