
//
//  ReflectionView.m
//  coreAnimation
//
//  Created by apple on 17/3/9.
//  Copyright © 2017年 Mr.chi. All rights reserved.
//

#import "ReflectionView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ReflectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (Class)layerClass {
    
    return [CAReplicatorLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatCircle];
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}
//倒影动画
- (void)setUp {
    
    //configure replicator
    CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
    layer.instanceCount = 2;
    
    //move reflection instance below original and flip vertically
    CATransform3D transform = CATransform3DIdentity;
    CGFloat verticalOffset = self.bounds.size.height ;
    transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
    transform = CATransform3DScale(transform, 1, -1, 0);
    layer.instanceTransform = transform;
    
    //reduce alpha of reflection layer
    layer.instanceAlphaOffset = -0.6;//    [self.layer addSublayer:layer];
}


//柱子动图
- (void)firstReplicatorAnimation {
    
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.center  =self.center;
    [self addSubview:view];

    view.layer.masksToBounds = YES;
    
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame = CGRectMake(0, 0, 100, 100);
    
    //修改 layer 的中心点，会影响view的frame
//    layer.anchorPoint = CGPointMake(0, 0);
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [view.layer addSublayer:layer];
    
    CALayer *rectangle = [CALayer layer];
    rectangle.bounds = CGRectMake(0, 0, 20, 90);
    //中心点设为左上角
    rectangle.anchorPoint = CGPointMake(0, 0);
    //设置layer的x,y
    rectangle.position = CGPointMake(10 ,90);
    rectangle.backgroundColor = [UIColor redColor].CGColor;
    [layer addSublayer:rectangle];
    
    CABasicAnimation * moveRectangle = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveRectangle.toValue = [NSValue valueWithCGPoint:CGPointMake(10, 20)];
    moveRectangle.duration = 0.7;
    moveRectangle.autoreverses = YES;
    moveRectangle.repeatCount = HUGE;
    [rectangle addAnimation:moveRectangle forKey:nil];
    
    //复制2个相同的layer
    layer.instanceCount = 3;
    //与上一个layer的X距离30
    layer.instanceTransform = CATransform3DMakeTranslation(30, 0, 0);
    //与上一个的layer动画延迟0.3秒
    layer.instanceDelay = 0.3;
}

- (void)creatCircle {
    
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:layer];
    
    CALayer * circleLayer = [CALayer layer];
    circleLayer.bounds = CGRectMake(0, 0, 15, 15);
    circleLayer.anchorPoint  = CGPointMake(0, 0);
    circleLayer.position = CGPointMake(layer.bounds.size.width/2, 10);
    circleLayer.cornerRadius = 7.5;
    circleLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [layer  addSublayer:circleLayer];
    circleLayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue  = [NSNumber numberWithFloat:0.1];
    animation.duration = 1.0;
    animation.repeatCount = HUGE;
    
    [circleLayer addAnimation:animation forKey:nil];
    
    layer.instanceCount = 15;
    CGFloat angel = M_PI * 2 / 15 ;
    layer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 1);
    layer.instanceDelay = 0.0667;
    
}

@end
