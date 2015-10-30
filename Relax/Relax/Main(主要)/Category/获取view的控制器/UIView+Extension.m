//
//  UIView+Extension.m
//  Travel
//
//  Created by lanou on 15/10/29.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

#pragma 获取当前视图的控制器
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
