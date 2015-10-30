//
//  UIBarButtonItem+Extension.m
//  LOWeiBo
//
//  Created by lanou on 15/10/3.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Frame.h"
@implementation UIBarButtonItem (Extension)


+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highlightedImage{
//自定义 barbuttonItem
UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
[button addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
[button setBackgroundImage:[UIImage imageNamed:image]  forState:(UIControlStateNormal)];
[button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:(UIControlStateHighlighted)];
//设置尺寸
button.size = button.currentBackgroundImage.size;

    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
