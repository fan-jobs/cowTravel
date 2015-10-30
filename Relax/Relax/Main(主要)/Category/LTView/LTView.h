//
//  LTView.h
//  UI03_custonView\LTView\Controller
//
//  Created by 吴书敏 on 15/9/2.
//  Copyright (c) 2015年 吴书敏. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 ltView 中有两个控件，一个是label 在左边
 一个是 textField 在右边
 label   textField
 */
@interface LTView : UIView

// label 控件
@property (nonatomic,retain,readonly) UILabel *label; // label

// textField
@property (nonatomic,retain,readonly) UITextField *textField; // textField

// 设置为readonly 让外界不能改变我们内部的控件

// 如果我们想要ltview ，创建出来就自带一些属性，就需要重写它的构造方法 ， 也就是自定义方法 init

// 重写构造方法，自定义初始化方法
// 自定义初始化方法 有 四个参数，
// frame确定了 ltview 的x,y width height
// labelwidth 为label 的宽度
// text 为 label 的标题
// placeholder 为占位符
// 这四个参数是我们提供给外界的接口
- (instancetype)initWithFrame:(CGRect)frame labelWidth:(CGFloat)labelwidth text:(NSString *)text placeholder:(NSString *)placeholder;


// 创建一个便利构造器
+ (LTView *)ltViewWithFrame:(CGRect)frame labelWidth:(CGFloat)labelwidth text:(NSString *)text placeholder:(NSString *)placeholder;



@end
