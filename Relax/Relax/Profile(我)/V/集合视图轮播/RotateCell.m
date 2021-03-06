//
//  RoofCell.m
//  Travel
//
//  Created by lanou on 15/10/29.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "RoofCell.h"
#import "Carousel.h"
@interface RoofCell ()

@end

@implementation RoofCell

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_imageV];
    }
    return self;
}

- (void)setCarousel:(Carousel *)carousel{
    _carousel = carousel;
    [_imageV sd_setImageWithURL:[NSURL URLWithString:carousel.img] placeholderImage:nil];
}

@end
