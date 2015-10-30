//
//  RelaxViewController.m
//  Relax
//
//  Created by lanou on 15/10/30.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "RelaxNavigationViewController.h"

@interface RelaxNavigationViewController ()

@end

@implementation RelaxNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"back" highlightedImage:@"back_highlighted"];
        self.navigationBarHidden = NO;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back{

    [self popViewControllerAnimated:YES];
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
