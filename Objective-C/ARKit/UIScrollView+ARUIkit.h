//
//  UIScrollView+ARUIkit.h
//  TestARKit
//
//  Created by Objective-C on 16/9/12.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (ARUIkit)

/**
 *  Judge whether at top
 *
 *  @return whether scrollView is at top
 */
- (BOOL)ar_isAtTop;

/**
 *  function scroll To Top
 */
- (void)ar_scrollsToTop;


@end
