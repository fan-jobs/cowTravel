//
//  MainView.m
//  RelaxStartAnimation
//
//  Created by lanou on 15/11/6.
//  Copyright (c) 2015年 方典. All rights reserved.
//
// RGB颜色
#define KColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define KRandomColor KColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 屏幕宽高
#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

#import "MainView.h"
#import "UIView+Frame.h"

@interface MainView ()

@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) BOOL isClose;
@property (nonatomic, strong) NSMutableArray *arrM;

@property (nonatomic, strong) UIView *rippleView;

@property (nonatomic, assign) CGFloat scale;

@property (nonatomic, strong) CADisplayLink *link;
@end


@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
       
        _mainBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_mainBtn setImage:[UIImage imageNamed:@"main"] forState:(UIControlStateNormal)];
        [_mainBtn setBackgroundImage:[UIImage imageNamed:@"main1"] forState:(UIControlStateNormal)];
        _mainBtn.size = _mainBtn.currentImage.size;
        _mainBtn.center = CGPointMake(KScreenW / 2, KScreenH / 2);
        [_mainBtn addTarget:self action:@selector(shrink) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_mainBtn];
        
        _musicBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addbutton:_musicBtn queue:0 normalImageNamge:@"main" highlightedImageNamge:nil];
        
      
        _cookBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addbutton:_cookBtn queue:1 normalImageNamge:@"main" highlightedImageNamge:nil];
        
        _communityBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addbutton:_communityBtn queue:2 normalImageNamge:@"main" highlightedImageNamge:nil];
        
        _readBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addbutton:_readBtn queue:3 normalImageNamge:@"main" highlightedImageNamge:nil];
        
        _tempBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addbutton:_tempBtn queue:4 normalImageNamge:@"main" highlightedImageNamge:nil];
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"mainground"]]];
        _isOpen = YES;
        _isClose = YES;
        _scale = 1.0;
        _arrM = [NSMutableArray arrayWithObjects:[NSValue valueWithCGPoint:_musicBtn.center], [NSValue valueWithCGPoint:_communityBtn.center], [NSValue valueWithCGPoint:_cookBtn.center] , [NSValue valueWithCGPoint:_readBtn.center], [NSValue valueWithCGPoint:_tempBtn.center], nil];
        
       
        [self bringSubviewToFront:_mainBtn];
        
        
        
        _musicBtn.center = _mainBtn.center;
        _communityBtn.center = _mainBtn.center;
        _tempBtn.center = _mainBtn.center;
        _readBtn.center = _mainBtn.center;
        _cookBtn.center = _mainBtn.center;
    }
    return self;
}

- (void)addrippleView{

    _rippleView = [[UIView alloc] init];
    _rippleView.size = _mainBtn.size;
    _rippleView.center = (CGPoint){KScreenW / 2, KScreenH / 2};
    _rippleView.layer.shadowOpacity = 1;
    _rippleView.layer.shadowColor = KColor(203, 223, 224).CGColor;
    _rippleView.layer.shadowRadius = 10;
    _rippleView.layer.cornerRadius = _rippleView.width / 2;
    _rippleView.layer.borderColor = KColor(39, 137, 232).CGColor;
    _rippleView.layer.borderWidth = 1;
   // [self addSubview:_rippleView];
}


- (void)drawRect:(CGRect)rect{

//    CGContextRef cxt = UIGraphicsGetCurrentContext();
//    CGPoint center = CGPointMake(KScreenW / 2, KScreenH / 2);
//    CGFloat radius = KScreenW / 3;
//    CGFloat stratA = 0;
//    CGFloat endA = M_PI * 2;
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:stratA endAngle:endA clockwise:YES];
//    CGContextSetLineWidth(cxt, 5);
//
//    CGContextSetRGBStrokeColor(cxt, 43 / 255.0, 67 / 255.0, 117 / 255.0, 1);
//    CGContextAddPath(cxt, path.CGPath);
//    CGContextStrokePath(cxt);

    
//    /*** 水纹效果 */
//    _scale += 0.05;
//    _rippleView.size = (CGSize){_mainBtn.width * _scale, _mainBtn.height * _scale};
//    _rippleView.center = _mainBtn.center;
//    _rippleView.layer.cornerRadius = _rippleView.size.width / 2;
//    
//    // 当水纹的半径超过屏幕时, 回到初始.
//    if (_rippleView.width > KScreenH * (1 + 0.2)) {
//        /*** 让水纹回到最初size */
//        _rippleView.size = _mainBtn.size;
//        _rippleView.center = _mainBtn.center;
//        _rippleView.layer.cornerRadius = _mainBtn.size.width / 2;
//        _scale = 1;
//        [_link invalidate];
//    }
    
}

- (void)addbutton: (UIButton *)button
           queue : (NSInteger)queue
 normalImageNamge: (NSString *)name
 highlightedImageNamge: (NSString *)highname{
    float count = 5.0;
    CGFloat r = KScreenW / 3;
    CGFloat angle = M_PI * 2 / count;

    [button setImage:[UIImage imageNamed:name] forState:(UIControlStateNormal)];
    [button setImage:[UIImage imageNamed:highname] forState:(UIControlStateHighlighted)];

    CGFloat communityCX = KScreenW / 2 + cosf( angle * queue  + M_PI_2) * (r );
    CGFloat communityCY = KScreenH / 2 - sinf( angle * queue  + M_PI_2) * (r );
    button.size = button.currentImage.size;
    button.center = CGPointMake(communityCX, communityCY);
    [self addSubview:button];
}

- (void)shrink{
    
    if (!_isClose) {

        [UIView animateWithDuration:0.25 animations:^{
           
            _musicBtn.center = _mainBtn.center;
            _cookBtn.center = _mainBtn.center;
            _communityBtn.center = _mainBtn.center;
            _tempBtn.center = _mainBtn.center;
            _readBtn.center = _mainBtn.center;
            [self bringSubviewToFront:_mainBtn];
        }];
        _isClose = YES;
        
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            
            _musicBtn.center = [_arrM[0] CGPointValue];
            _cookBtn.center = [_arrM[1] CGPointValue];
            _communityBtn.center = [_arrM[2] CGPointValue];
            _tempBtn.center = [_arrM[3] CGPointValue];
            _readBtn.center = [_arrM[4] CGPointValue];
        }];
        _isClose = NO;
//        /*** 添加定时器, 屏幕刷新的时候调用 */
//        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
//        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
}



@end
