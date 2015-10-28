//
//  TNavigationController.m
//  Travel
//
//  Created by lanou on 15/10/28.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "TNavigationController.h"


@interface TNavigationController ()

@end

@implementation TNavigationController

+ (void)initialize{
    
    /** 设置导航栏 文字 和 背景 属性[UINavigationBar appearance]; */
    
    // 设置整个项目所有item 的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    // key: NS*****AttributeName
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [item setTitleTextAttributes:textAttrs forState:(UIControlStateNormal)];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    // 每一个像素都有自己的颜色, 每一种颜色都可以有RGB3色组成
    // 12bit颜色: #f00 第一位红, 第二位绿色, 第三位蓝色
    // 24bit颜色: #ff 00 00 每2位一个颜色
    // RGBA 加上透明度
    // 32bit颜色: #ff 00 00 55
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [item setTitleTextAttributes:disableTextAttrs forState:(UIControlStateDisabled)];
    
}


#warning 重写push方法,拦截push进去的控制器.实现需求.
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"back" highlightedImage:@"back_highlighted"];
    }
    
    [super pushViewController:viewController animated:animated];
}


- (void)back{
    
    [self popoverPresentationController];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
