//
//  UIBarButtonItem+Extension.h
//  LOWeiBo
//
//  Created by lanou on 15/10/3.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highlightedImage;
@end
