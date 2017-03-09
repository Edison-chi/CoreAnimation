//
//  BlockExecutor.m
//  coreAnimation
//
//  Created by apple on 17/3/7.
//  Copyright © 2017年 Mr.chi. All rights reserved.
//

#import "BlockExecutor.h"

@implementation BlockExecutor

- (instancetype)initWithBlock:(voidBlock) block{
    
    self = [super init];
    
    if(self){
        
        _block = [block copy];
    }
    return self;
}


- (void)delloc {
    
    _block ? _block():nil;
}
@end
