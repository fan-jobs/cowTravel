//
//  FDFlowLayout.m
//  自定义UIcollectionViewFlowLatout
//
//  Created by lanou on 15/10/24.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "FDFlowLayout.h"

static const CGFloat layoutWH = 100;

@implementation FDFlowLayout
- (instancetype)init{

    if (self = [super init]) {
       //
        
    }
    return self;
}




/**
 *  一些初始化工作在此做
 */
- (void)prepareLayout{

    //初始化
    // 每个cell的尺寸
    self.itemSize = CGSizeMake(layoutWH, layoutWH);
    CGFloat inset = (self.collectionView.frame.size.width - layoutWH) / 2;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    self.minimumLineSpacing = 100;
    
    // 滑动方向--> 水平
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 每一个cell 都有一个 UICollectionViewLayoutAttributes

}





/**
 *  只要显示的边界发生改变就会重新布局
 *
 *  内部会重新调用layoutAttributesForElementsInRect 方法
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{

    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    // 1.取得默认的cell的UICollectionViewLayoutAttributes
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // 2.计算屏幕最中间的x
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    // 2.遍历所有的布局属性
    for (UICollectionViewLayoutAttributes *attributes in array) {
        /*** 只需要缩放可见的cell, 不可见的不需要缩放 */
        // 若cell和 屏幕的frame相交 则是可见的.
        // 0. 计算课可见的矩形框
        CGRect visiableRect;
        visiableRect.size = self.collectionView.frame.size;
        visiableRect.origin = self.collectionView.contentOffset;
        //CGRectIntersectsRect 判断2个rect是否相交
            // 若不相交则继续相交的
        if (!CGRectIntersectsRect(visiableRect, attributes.frame)) continue;
        
        // 每一个item的中点x
        CGFloat itemCenterX = attributes.center.x;
        
        // 差距越小, 缩放比例越大
        // 根据跟屏幕最中间的距离计算缩放比例
        CGFloat scale = 1 + (1 - ABS(itemCenterX - centerX) / self.collectionView.frame.size.width) * 0.8;
        attributes.transform3D = CATransform3DMakeScale(scale, scale, 1);
    }
    return array;
}



/**
 *  用来设置scrollView停止滚动那一刻的位置
 *
 *  @param proposedContentOffset 原本scrollView停止那一刻的位置
 *  @param velocity              滚动速度
 *
 *  @return 返回一个scrollView停止的位置
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    // 1. 计算出scrollView最后会停留的范围
    CGRect lastRect;
    lastRect.origin = proposedContentOffset;
    lastRect.size = self.collectionView.frame.size;
    
    // 计算屏幕最中间的x
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    // 2. 取出这个范围内的所用属性
    NSArray *array = [self layoutAttributesForElementsInRect:lastRect];
    
    // 3. 遍历所有属性
    CGFloat adjustOffsetX = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in array) {
        if (ABS(attr.center.x - centerX) < ABS(adjustOffsetX)) {
            adjustOffsetX = attr.center.x - centerX;
        }
    }
    return CGPointMake(proposedContentOffset.x + adjustOffsetX, proposedContentOffset.y);
    
}
@end
