//
//  UIView+QuickCreate.h
//  Just Practice
//
//  Created by Archy on 15/6/5.
//  Copyright (c) 2015年 Van. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QuickCreate)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

@end

@interface UISlider (QuickCreate)
+(UISlider *)newSliderWithFrame:(CGRect)frame maximumValue:(float)maximumValue minimumValue:(float)minimumValue value:(float                    )value setValue:(float)setValue target:(id)target andAction:(SEL)sel;

@end

@interface UILabel (QuickCreate)
+(UILabel *)newLabelWithFrame:(CGRect)frame alignment:(NSTextAlignment)alignment title:(NSString *)title andFont:(CGFloat)font;

@end

@interface UIButton (QuickCreate)
+(UIButton *)newButtonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title target:(id)target andAction:(SEL)sel;

@end

@interface UITextField (QuickCreate)
+(UITextField *)newTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder textAlignment:(NSTextAlignment)textAlignment secureTextEntry:(BOOL)secureTextEntry keyboardType:(UIKeyboardType)keyboardType;

@end

@interface UIImageView (QuickCreate)
+ (UIImageView *)newImageViewWithFrame:(CGRect)frame withImageNamed:(NSString *)image;

@end

@interface UIBarButtonItem (QuickCreate)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target andAction:(SEL)action;

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedName target:(id)target action:(SEL)action;

@end
