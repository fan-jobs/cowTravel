//
//  TopView.m
//  Travel
//
//  Created by lanou on 15/10/28.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "TopView.h"
@interface TopView ()<UITextFieldDelegate>



@end

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        // btn
        CGFloat btnW = KScreenW * 0.13;
        CGFloat centerY = self.height / 2;
        CGFloat btnX = kSpacing;
        self.cityBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_cityBtn setTitle:@"上海" forState:(UIControlStateNormal)];
        [_cityBtn addTarget:self action:@selector(changeCity) forControlEvents:(UIControlEventTouchUpInside)];
        _cityBtn.x = btnX;
        _cityBtn.centerY = centerY;
        _cityBtn.width = btnW;
        _cityBtn.height = _cityBtn.currentAttributedTitle.size.height;
        [self addSubview:_cityBtn];
        
        // 搜索框
        CGFloat tfW = KScreenW * 0.63;
        CGFloat tfH = 30;
        CGFloat tfCX = KScreenW / 2; //centerX

        self.searchTF = [[UITextField alloc] init];
        _searchTF.borderStyle = UITextBorderStyleRoundedRect;
        _searchTF.width = tfW;
        _searchTF.height = tfH;
        _searchTF.centerX = tfCX;
        _searchTF.centerY = centerY;
        _searchTF.delegate = self;
        [self addSubview:_searchTF];
        
        // 扫描二维码
        self.scannerBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_scannerBtn setImage:[UIImage imageNamed:@"saomiao"] forState:(UIControlStateNormal)];
        [_scannerBtn setImage:[UIImage imageNamed:@"saomiao_highlighted"] forState:(UIControlStateHighlighted)];
       

        [self addSubview:_scannerBtn];
         CGFloat sBtnX = KScreenW - _scannerBtn.currentImage.size.width - kSpacing;
        _scannerBtn.size = _scannerBtn.currentImage.size;
        _scannerBtn.centerY = centerY;
        _scannerBtn.x = sBtnX - 5;
        
        self.backgroundColor = [UIColor clearColor]; // 设置透明
        
        
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)changeCity{

    
}


@end
