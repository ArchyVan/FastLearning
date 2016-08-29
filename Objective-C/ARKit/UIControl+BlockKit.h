//
//  UIControl+BlockKit.h
//  ARKit
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonMacros.h"

@interface UIControl (BlockKit)

/**
 *	@author Archy Van
 *
 *	Make it support block callback of touch up event.
 */
@property (nonatomic, copy) ARButtonBlock ar_onTouchUp;

/**
 *	@author Archy Van
 *
 *	Make it support block callback of touch down event.
 */
@property (nonatomic, copy) ARButtonBlock ar_onTouchDown;

/**
 *	@author Archy Van
 *
 *	Make it support block callback of value change event.
 */
@property (nonatomic, copy) ARValueChangedBlock ar_onValueChanged;

/**
 *	@author Archy Van
 *
 *	Make it support block callback of editing changed event.
 */
@property (nonatomic, copy) AREditChangedBlock ar_onEditChanged;


@end
