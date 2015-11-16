//
//  RoofView.m
//  Travel
//
//  Created by lanou on 15/10/29.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "RoofView.h"
#import "RoofCell.h"
#import "RoofDetailViewController.h"
#import "Carousel.h"
#import "FMViewController.h"
@interface RoofView ()<UICollectionViewDataSource, UICollectionViewDelegate>


@property (nonatomic,strong) UIPageControl *pageControl;


@end
@implementation RoofView
static NSString *ID = @"roofCell";
- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        UICollectionViewFlowLayout *latout = [[UICollectionViewFlowLayout alloc] init];
        latout.itemSize = frame.size;
        latout.minimumLineSpacing = 0;
        
        latout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, KScreenH * 0.24) collectionViewLayout:latout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.contentSize = CGSizeMake(KScreenW * _arr.count, frame.size.height);
        _collectionView.pagingEnabled = YES; // 整页翻动
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[RoofCell class] forCellWithReuseIdentifier:ID];
        [self addSubview:_collectionView];
        
        
        self.pageControl = [[UIPageControl alloc] init];
        _pageControl.size = CGSizeMake(KScreenW / 3, 20);
        _pageControl.x = KScreenW / 2 - _pageControl.width / 2;
        _pageControl.centerY = frame.size.height - kSpacing;
        _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
        _pageControl.pageIndicatorTintColor = KColor(123, 123, 123);
        _pageControl.userInteractionEnabled = NO;
        [self addSubview:_pageControl];
        

        _timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)autoScroll{

    //1获取scrollView 的宽度
    CGFloat width = KScreenW;
    
    //2让scrollView 偏移 并且做动画
    CGPoint offset = _collectionView.contentOffset;
    //3添加判断
    //如果已经是最后一张图
    if (offset.x + width == width * _arr.count){
        [_collectionView setContentOffset:(CGPointZero) animated:NO];//切换到最后一张不做动画
        [_collectionView setContentOffset:(CGPointMake(width, offset.y)) animated:YES];}//切换后 偏移width
    else{
        [_collectionView  setContentOffset:(CGPointMake(offset.x + width, offset.y)) animated:YES];
    }
}

#pragma UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _arr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    RoofCell *roofCell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    roofCell.carousel = _arr[indexPath.row];
    return roofCell;
}

- (void)setArr:(NSArray *)arr{

     _arr = arr;
     _pageControl.numberOfPages = arr.count - 1; // 设置pageControl的个数, 此时的arr才有值.
    [_collectionView reloadData];
}

#pragma UICollectionViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    /*** 轮播 */
    if (_collectionView.contentOffset.x > KScreenW * (_arr.count - 1)) {
        [scrollView setContentOffset:(CGPointZero) animated:NO];
    }else if(_collectionView.contentOffset.x < 0){
        
        _collectionView.contentOffset = CGPointMake(KScreenW * (_arr.count - 1), 0);
    }
    if (_collectionView.contentOffset.x  > KScreenW * (_arr.count - 1.5)) {
        _pageControl.currentPage = 0;
    }else{
        _pageControl.currentPage = _collectionView.contentOffset.x / KScreenW + 0.5;
    }
}

#pragma 获取当前视图的控制器
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


// 页面跳转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Carousel *carouser = _arr[indexPath.row];
    NSArray *arr = [carouser.url componentsSeparatedByString:@"/"];
    UIViewController *vc = [self viewController];
    //arr[2];ting, fm
    if ([arr[2] isEqual:@"ting"]) {
        RoofDetailViewController *rdVC = [[RoofDetailViewController alloc] init];
        
        rdVC.carouser = _arr[indexPath.row];
        [vc.navigationController pushViewController:rdVC animated:YES];
    }else{
        
        FMViewController *fmVC = [[FMViewController alloc] init];
        fmVC.carousel = carouser;
        [vc.navigationController pushViewController:fmVC animated:YES];
    }
}




@end
