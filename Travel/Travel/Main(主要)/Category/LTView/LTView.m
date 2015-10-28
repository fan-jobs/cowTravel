//
//  LTView.m
//  UI03_custonView\LTView\Controller
//
//  Created by 吴书敏 on 15/9/2.
//  Copyright (c) 2015年 吴书敏. All rights reserved.
//

#import "LTView.h"

#define kHorizonSpacing 10 // 水平间距

@implementation LTView

+ (LTView *)ltViewWithFrame:(CGRect)frame labelWidth:(CGFloat)labelwidth text:(NSString *)text placeholder:(NSString *)placeholder
{
    return [[LTView alloc] initWithFrame:frame labelWidth:labelwidth text:text placeholder:placeholder];
}


// 自定义初始化方法
- (instancetype)initWithFrame:(CGRect)frame labelWidth:(CGFloat)labelwidth text:(NSString *)text placeholder:(NSString *)placeholder
{
    // 调用父类的initWithFrame初始化方法
    self = [super initWithFrame:frame];
    
    if (self) {
        // 对ltView 进行初始化，加载textField 以及 label
        
        CGFloat totalWidth = self.frame.size.width; // ltview 的宽度
        CGFloat totalHeight = self.frame.size.height; // ltView的高度
        
        // 创建label子视图
        _label = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, labelwidth, totalHeight))];
        _label.text = text;
        [self addSubview:_label]; // 把_label 添加到ltView上
        
        
        // 创建textField
        _textField = [[UITextField alloc] initWithFrame:(CGRectMake(labelwidth + 10, 0, totalWidth - labelwidth - 10, totalHeight))];
        
        _textField.placeholder = placeholder; // 外界给定的placeholder
        
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_textField]; // 添加到ltView 上
        
        
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
