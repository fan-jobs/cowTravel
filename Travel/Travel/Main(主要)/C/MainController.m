//
//  MainController.m
//  Travel
//
//  Created by lanou on 15/10/28.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "MainController.h"
#import "HomeController.h"
#import "CategoryController.h"
#import "DestinationController.h"
#import "DiscoverController.h"
#import "ProfileController.h"



@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*** 加载控制器 */
    HomeController *homeC = [[HomeController alloc] init];
    [self addChildVc:homeC title:@"主页" image:@"home" selectedImage:@"home_highlighted"];
    
    
    CategoryController *cateC = [[CategoryController alloc] init];
    [self addChildVc:cateC title:@"分类" image:@"category" selectedImage:@"category_highlighted"];
    
    DestinationController *destiC = [[DestinationController alloc] init];
    [self addChildVc:destiC title:@"目的地" image:@"destination" selectedImage:@"destination_highlighted"];

    DiscoverController *discoverC = [[DiscoverController alloc] init];
    [self addChildVc:discoverC title:@"发现" image:@"discover" selectedImage:@"discover_highlighted"];
    
    ProfileController *profileC = [[ProfileController alloc] init];
    [self addChildVc:profileC title:@"我的" image:@"profile" selectedImage:@"profile_highlighted"];
    
    
    // Do any additional setup after loading the view.
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字和图片
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = KColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:naVC];
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
