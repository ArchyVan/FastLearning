//
//  UIView+ARUIKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ARUIKit)

#pragma mark - Convenience frame api
/**
 * view.frame.origin.x
 */
@property (nonatomic, assign) CGFloat ar_originX;

/**
 * view.frame.origin.y
 */
@property (nonatomic, assign) CGFloat ar_originY;

/**
 * view.frame.origin
 */
@property (nonatomic, assign) CGPoint ar_origin;

/**
 * view.center.x
 */
@property (nonatomic, assign) CGFloat ar_centerX;

/**
 * view.center.y
 */
@property (nonatomic, assign) CGFloat ar_centerY;

/**
 * view.center
 */
@property (nonatomic, assign) CGPoint ar_center;

/**
 * view.frame.size.width
 */
@property (nonatomic, assign) CGFloat ar_width;

/**
 * view.frame.size.height
 */
@property (nonatomic, assign) CGFloat ar_height;

/**
 * view.frame.size
 */
@property (nonatomic, assign) CGSize  ar_size;

/**
 *  view.frame.origin.x
 */
@property (nonatomic, assign) CGFloat ar_left;

/**
 *  view.frame.origin.y
 */
@property (nonatomic, assign) CGFloat ar_top;

/**
 *  view.frame.origin.x + view.frame.size.width
 */
@property (nonatomic, assign) CGFloat ar_right;

/**
 *  view.frame.origin.y + view.frame.size.height
 */
@property (nonatomic, assign) CGFloat ar_bottom;

/**
 *  Get/Set the control's corneradus
 *  Default is 0.0
 */
@property (nonatomic, assign) CGFloat ar_cornerRadius;

/**
 *  Get/Set the control's border color
 *  Default is [UIColor lightGrayColor]
 */
@property (nonatomic, strong) UIColor *ar_borderColor;

/**
 *  Get/Set the control's border width
 *  Default is 0.0
 */
@property (nonatomic, assign) CGFloat ar_borderWidth;

/**
 *  Set the control to be circle.
 *  Default is NO.
 */
@property (nonatomic, assign) BOOL isCircle;


@end
