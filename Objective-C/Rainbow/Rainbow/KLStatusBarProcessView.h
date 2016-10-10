//
//  KLStatusBarProcessView.h
//  NovelReader2
//
//  Created by Bill Cheng on 14-6-23.
//  Copyright (c) 2014年 R3 Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLStatusBarProcessView : UIView<CAAnimationDelegate>{
    CALayer *maskLayer;
}

@property (nonatomic, readonly, getter=isAnimating) BOOL animating;
@property (nonatomic, readwrite, assign) CGFloat progress;

- (void)startAnimating;
- (void)stopAnimating;

@end
