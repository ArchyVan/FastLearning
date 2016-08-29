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
 *	@author Archy Van
 *
 *	Make all gestures support block callback.
 *  This will support all kinds of gestures.
 */
@property (nonatomic, copy) ARGestureBlock ar_onGesture;

/**
 *	@author Archy Van
 *
 *	Make tap gesture support block callback.
 */
@property (nonatomic, copy) ARTapGestureBlock ar_onTaped;

/**
 *	@author Archy Van
 *
 *	Make long press gesture support block callback.
 */
@property (nonatomic, copy) ARLongGestureBlock ar_onLongPressed;

@end
