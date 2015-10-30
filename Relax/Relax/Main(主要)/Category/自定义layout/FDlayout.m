//
//  FDlayout.m
//  自定义UIcollectionViewFlowLatout
//
//  Created by lanou on 15/10/25.
//  Copyright (c) 2015年 方典. All rights reserved.
//
#define FDRandom0_1 (arc4random_uniform(100) / 100.0)
#import "FDlayout.h"

@implementation FDlayout

- (instancetype)init{

    if (self = [super init]) {
        
    }
    return self;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{

    return YES;
}

- (CGSize)collectionViewContentSize{

    return self.collectionView.frame.size;
}


/**
 *  必须实现的方法.
 *  layoutAttributesForItemAtIndexPath:
 *  layoutAttributesForElementsInRect:
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{

    //继承自layout, 系统不会给我们计算, 得我们自己计算,下面这个方法不适用
    // NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *array = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        attrs.size = CGSizeMake(50, 50);
        
        /*
        attrs.center = CGPointMake(self.collectionView.frame.size.width / 2, self.collectionView.frame.size.height);
        attrs.transform = CGAffineTransformMakeRotation(FDRandom0_1 * M_PI_4);
         */
        
        //圆的半径
        CGFloat circleRadius = 100;
        //圆的中心点
        CGPoint circleCenter = CGPointMake(self.collectionView.frame.size.width /  2, self.collectionView.frame.size.height / 2);
        // 每个item之间的角度
        CGFloat angeleDelta = M_PI * 2 / count;
        // 计算当前item的角度
        CGFloat angle = i * angeleDelta;
        attrs.center = CGPointMake(circleCenter.x + circleRadius * cosf(angle), circleCenter.y - circleRadius * sinf(angle));
        
        [array addObject:attrs];
    }
    return array;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"xx");
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:indexPath.item inSection:indexPath.section]];
    attrs.size = CGSizeMake(50, 50);
    
    /*
    attrs.center = CGPointMake(self.collectionView.frame.size.width / 2, self.collectionView.frame.size.height);
    attrs.transform = CGAffineTransformMakeRotation(FDRandom0_1 * M_PI_4);
    */
    
    //圆的半径
    CGFloat circleRadius = 100;
    //圆的中心点
    CGPoint circleCenter = CGPointMake(self.collectionView.frame.size.width /  2, self.collectionView.frame.size.height / 2);
    // 每个item之间的角度
    CGFloat angeleDelta = M_PI * 2 / [self.collectionView numberOfItemsInSection:indexPath.section];
    // 计算当前item的角度
    CGFloat angle = indexPath.item * angeleDelta;
    attrs.center = CGPointMake(circleCenter.x + circleRadius * cosf(angle), circleCenter.y - circleRadius * sinf(angle));
    attrs.zIndex = indexPath.item;
    
    return attrs;
}



@end
