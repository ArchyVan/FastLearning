//
//  TestView.m
//  TestReactiveCocoa
//
//  Created by Objective-C on 2016/10/14.
//  Copyright © 2016年 Archy Van. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.testButton.frame = CGRectMake((frame.size.width - 100) /2.0, (frame.size.height - 40)/2.0, 100, 40);
        [self.testButton setTitle:@"Delegate" forState:UIControlStateNormal];
        [self.testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.testButton.layer.cornerRadius = 20;
        self.testButton.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:0.7].CGColor;
        self.testButton.layer.borderWidth = 1;
        [self.testButton addTarget:self action:@selector(_buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.testButton];
    }
    return  self;
}

- (void)_buttonAction:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(testViewDidClickButton:)]) {
        [self.delegate testViewDidClickButton:self];
    }
}

@end
