//
//  RoofCell.h
//  Travel
//
//  Created by lanou on 15/10/29.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Carousel;

@interface RoofCell : UICollectionViewCell
@property (nonatomic,strong) Carousel *carousel;
@property (nonatomic,strong) UIImageView *imageV;
@end
