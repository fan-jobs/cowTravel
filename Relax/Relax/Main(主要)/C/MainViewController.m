//
//  MainViewController.m
//  Relax
//
//  Created by lanou on 15/10/30.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "MainViewController.h"
#import "CommunityViewController.h"
#import "MusicViewController.h"
#import "ProfileViewController.h"
#import "ReadViewController.h"
#import "TravelViewController.h"
#import "RelaxNavigationViewController.h"
@interface MainViewController ()

@property (nonatomic, strong) UIImageView *backIV;
@property (nonatomic, strong) UIButton *music;
@property (nonatomic, strong) UIButton *community;
@property (nonatomic, strong) UIButton *profile;
@property (nonatomic, strong) UIButton *read;
@property (nonatomic, strong) UIButton *travel;

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backIV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _backIV.image = [UIImage imageNamed:@"background"];
    _backIV.userInteractionEnabled = YES;
    self.view = _backIV;

    /*** 配置button */
    [self setupButton:_music imageName:@"music" action:@selector(goToMusic) origin:(CGPointMake(100, 100))];
    
    [self setupButton:self.community imageName:@"community" action:@selector(goToCommunity) origin:CGPointMake(100, 200)];
    
    [self setupButton:_read imageName:@"read" action:@selector(goToRead) origin:(CGPointMake(100, 300))];
    
    [self setupButton:_travel imageName:@"travel" action:@selector(goToTravel) origin:(CGPointMake(200, 100))];
    
    [self setupButton:_profile imageName:@"me" action:@selector(goToProfile) origin:(CGPointMake(200, 200))];

}




- (void)setupButton:(UIButton *)button
          imageName:(NSString *)string
             action:(SEL)action
             origin:(CGPoint)point{
    button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:string] forState:(UIControlStateNormal)];
    [button addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    button.size = button.currentImage.size;
    button.origin = point;
    [_backIV addSubview:button];
}

- (void)goToProfile{
    ProfileViewController *pfVC = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:pfVC animated:YES];
}

- (void)goToTravel{
    TravelViewController *tVC = [[TravelViewController alloc] init];
    [self.navigationController pushViewController:tVC animated:YES];
}

- (void)goToRead{
    ReadViewController *rVC = [[ReadViewController alloc] init];
    [self.navigationController pushViewController:rVC animated:YES];
}


- (void)goToCommunity{
    CommunityViewController *cVC = [[CommunityViewController alloc] init];
    [self.navigationController pushViewController:cVC animated:YES];
}

- (void)goToMusic{
    MusicViewController *mVC = [[MusicViewController alloc] init];
    [self.navigationController pushViewController:mVC animated:YES];
}


@end
