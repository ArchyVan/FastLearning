//
//  UIView+BlockKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonMacros.h"
@interface UIView (BlockKit)
/**
 *	@author Archy Van
 *
 *  The tap gesture getter. @see ar_addTapGestureWithCallback
 */
@property (nonatomic, strong, readonly) UITapGestureRecognizer *ar_tapGesture;

/**
 *	@author Archy Van
 *
 *	The long press gesture getter, @see ar_addLongGestureWithCallback
 */
@property (nonatomic, strong, readonly) UILongPressGestureRecognizer *ar_longGesure;

/**
 *	@author Archy Van
 *
 *	Add a tap gesture with callback. It will automatically open userInterface to YES.
 *
 *	@param onTaped	The callback block when taped.
 */
- (void)ar_addTapGestureWithCallback:(ARTapGestureBlock)onTaped;

/**
 *	@author Archy Van
 *
 *	Add long press gesture with callback. It will automatically open userInterface to YES.
 *
 *	@param onLongPressed	The long press callback when long pressed.
 */
- (void)ar_addLongGestureWithCallback:(ARLongGestureBlock)onLongPressed;


@end
