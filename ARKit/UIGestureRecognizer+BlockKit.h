//
//  UIGestureRecognizer+BlockKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonMacros.h"

@interface UIGestureRecognizer (BlockKit)
/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Make all gestures support block callback.
 *  This will support all kinds of gestures.
 */
@property (nonatomic, copy) ARGestureBlock ar_onGesture;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Make tap gesture support block callback.
 */
@property (nonatomic, copy) ARTapGestureBlock ar_onTaped;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Make long press gesture support block callback.
 */
@property (nonatomic, copy) ARLongGestureBlock ar_onLongPressed;

@end
