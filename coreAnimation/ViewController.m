//
//  ViewController.m
//  coreAnimation
//
//  Created by apple on 17/3/6.
//  Copyright © 2017年 Mr.chi. All rights reserved.
//

#import "ViewController.h"
#import "ReflectionView.h"

@interface ViewController ()

@property (strong,nonatomic)UIView * layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    _layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
//    [self.view addSubview:_layerView];
//    _layerView.center = self.view.center;
    
//    /*
//     */ //添加一个蓝色图层
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(50, 50, 100, 100);
//    layer.backgroundColor = [UIColor blueColor].CGColor;
//    [_layerView.layer addSublayer:layer];
    
//    //放大
//    CGAffineTransform  transfrom =  CGAffineTransformMakeScale(2, 2);
//    layer.affineTransform = transfrom;
    
    //旋转45°
//    CGAffineTransform transfrom = CGAffineTransformMakeRotation(M_PI_4);
//    layer.affineTransform = transfrom;
    
    /*
     * //添加一个Image到 layer的contents
     
    UIImage *image = [UIImage imageNamed:@"1234.jpg"];
    layerView.layer.contents = (__bridge id)image.CGImage;
    
    layerView.layer.contentsRect = CGRectMake(0.25, 0.25, 0.5, 0.5);
     */
    
    
//    //CAReplicatorLayer的倒影
//    UIImage *image = [UIImage imageNamed:@"1234.jpg"];
//    ReflectionView *view = [[ReflectionView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
//    UIImageView * imageView = [[UIImageView alloc]initWithFrame:view.bounds];
//    imageView.image = image;
//    [view addSubview:imageView];
//    [self.view addSubview:view];
    
//    //缩放 位移 旋转
//    
//    CGAffineTransform transform = CGAffineTransformIdentity;
//    
//    transform  = CGAffineTransformMakeScale(0.5, 0.5);
//    transform  = CGAffineTransformMakeRotation(M_PI/180 * 30);
//    transform  = CGAffineTransformTranslate(transform, 200, 0);
//    layer.affineTransform  = transform;

//    CATransform3D transform = CATransform3DIdentity;
//    transform.m34 = - 1.0/500.0;
//    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
//    layer.transform  = transform;
    
    
//    [self setupCAReplicatorLayer];
    
    
    //CAReplicatorLayer的动画
    
    ReflectionView *view = [[ReflectionView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
    

}


//画一个火柴人
- (void)CAShaperLayer {
    
    UIBezierPath * path  = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    [path moveToPoint: CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 2;
    layer.lineJoin  =  kCALineJoinRound;
    layer.path =path.CGPath;
    [self.view.layer addSublayer:layer];
}

- (void)CATextlayer {
    
    CATextLayer * layer = [CATextLayer layer];
    layer.frame = CGRectMake(100, 100, 200, 300);
    
    [self.view.layer addSublayer:layer];
    layer.foregroundColor = [UIColor blackColor].CGColor;
    layer.alignmentMode = kCAAlignmentJustified;
    layer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    
    layer.font = fontRef;
    layer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString * text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \ leo. Nunc quis nunc at mauris pharetra “condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \ lobortis";
    layer.contentsScale =  [UIScreen mainScreen].scale;
    layer.string = text;

}


- (CALayer *)faceWithTransform: (CATransform3D)transform {
    
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);
    
    CGFloat red = (rand()/(double)INT_MAX);
    CGFloat green = (rand()/(double)INT_MAX);
    CGFloat blue = (rand()/(double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    
    face.transform = transform;
    return face;
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform {
    
    CATransformLayer * cube = [CATransformLayer layer];
    
    //add cube face 1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //face 2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //face 4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //face 5
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    
    //face 6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    CGSize containerSize = self.view.bounds.size;
    
    cube.position = CGPointMake(containerSize.width/2, containerSize.height/2);
    cube.transform = transform;
    return cube;
}
//设置2个3D的 六方体
- (void)setupTransForm3D {
    
    CATransform3D pt = CATransform3DIdentity;
    
    pt.m34 = -1/500;
    
    self.view.layer.sublayerTransform = pt;
    
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    c1t = CATransform3DRotate(c1t, M_PI_4, 1, 1, 0);
//    c1t = CATransform3DRotate(c1t, M_PI_4, 0, 1, 0);

    [self.view.layer addSublayer:[self cubeWithTransform:c1t]];
    
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    
    [self.view.layer addSublayer:[self cubeWithTransform:c2t]];
}

//CAReplicatorLayer 类似湖水的反射
- (void)setupCAReplicatorLayer {

    
    
    
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    
//    CALayer *layer = [_layerView.layer hitTest:point];
//    
//    (layer == _layerView.layer) ? NSLog(@"_layerView"):NSLog(@"lanse");
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
