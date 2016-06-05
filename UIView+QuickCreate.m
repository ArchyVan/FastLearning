
//
//  UIView+QuickCreate.m
//  Just Practice
//
//  Created by Archy on 15/6/5.
//  Copyright (c) 2015年 Van. All rights reserved.
//

#import "UIView+QuickCreate.h"

@implementation UIView (QuickCreate)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

@end

@implementation UISlider(QuickCreate)

+(UISlider *)newSliderWithFrame:(CGRect)frame maximumValue:(float)maximumValue minimumValue:(float)minimumValue value:(float)value setValue:(float)setValue target:(id)target andAction:(SEL)sel
{
    UISlider *slider = [[UISlider alloc]initWithFrame:frame];
    slider.maximumValue = maximumValue;
    slider.minimumValue = minimumValue;
    slider.value = value;
    [slider setValue:setValue];
    [slider addTarget:target action:sel forControlEvents:UIControlEventValueChanged];
    return slider;
}

@end

@implementation UILabel(QuickCreate)

+(UILabel *)newLabelWithFrame:(CGRect)frame alignment:(NSTextAlignment)alignment title:(NSString *)title andFont:(CGFloat)font
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = alignment;
    label.text = title;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}

@end


@implementation UIButton(QuickCreate)

+(UIButton *)newButtonWithFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title target:(id)target andAction:(SEL)sel
{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

@end

@implementation UITextField(QuickCreate)

+(UITextField *)newTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder textAlignment:(NSTextAlignment)textAlignment secureTextEntry:(BOOL)secureTextEntry keyboardType:(UIKeyboardType)keyboardType
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placeHolder;
    textField.textAlignment = textAlignment;
    textField.secureTextEntry = secureTextEntry;
    textField.keyboardType = keyboardType;
    return textField;
}

@end

@implementation UIImageView (QuickCreate)

+(UIImageView *)newImageViewWithFrame:(CGRect)frame withImageNamed:(NSString *)image
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:image];
    return imageView;
}

@end

@implementation UIBarButtonItem (QuickCreate)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target andAction:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    button.size = button.currentBackgroundImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:highlightedName] forState:UIControlStateHighlighted];
    
    button.size = button.currentBackgroundImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
