//
//  TestView.h
//  TestReactiveCocoa
//
//  Created by Objective-C on 2016/10/14.
//  Copyright © 2016年 Archy Van. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestView;
@protocol TestViewDelegate <NSObject>

- (void)testViewDidClickButton:(TestView *)testView;

@end

@interface TestView : UIView

@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, weak) id <TestViewDelegate> delegate;
@end
