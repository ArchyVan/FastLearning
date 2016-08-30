//
//  UIButton+ARUIKit.h
//  bearead
//
//  Created by Objective-C on 16/8/30.
//  Copyright © 2016年 bearead. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,ButtonContentStyle) {
    ButtonContentStyleUp,
    ButtonContentStyleDown,
    ButtonContentStyleLeft,
    ButtonContentStyleRight
};

@interface UIButton (ARUIKit)

- (void)ar_layoutButtonWithEdgeInsetsStyle:(ButtonContentStyle)style imageTitlespace:(CGFloat)space;

@end
