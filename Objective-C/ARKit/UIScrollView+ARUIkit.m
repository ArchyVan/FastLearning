//
//  UIScrollView+ARUIkit.m
//  TestARKit
//
//  Created by Objective-C on 16/9/12.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import "UIScrollView+ARUIkit.h"

@implementation UIScrollView (ARUIkit)

- (BOOL)ar_isAtTop
{
    return self.contentOffset.y == self.contentInset.top;
}

- (void)ar_scrollsToTop
{
    CGPoint topPoint = CGPointMake(0, -self.contentInset.top);
    [self setContentOffset:topPoint];
}

@end
