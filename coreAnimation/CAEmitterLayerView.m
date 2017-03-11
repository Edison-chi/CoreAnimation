//
//  CAEmitterLayerView.m
//  coreAnimation
//
//  Created by chizhonghao on 17/3/9.
//  Copyright © 2017年 Mr.chi. All rights reserved.
//

#import "CAEmitterLayerView.h"

@implementation CAEmitterLayerView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.bounds;
    [self.layer addSublayer:emitter];
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width/2, emitter.frame.size.height/2);
    
    
    CAEmitterCell *cell = [[CAEmitterCell alloc]init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"1234.jpg"].CGImage;
    cell.birthRate = 150;
    cell.lifetime =5.0;
//    cell.color = [UIColor colorWithRed:1 green:0.5 blue:1 alpha:1].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI *2.0;
    emitter.emitterCells = @[cell];
    
    
}

@end
