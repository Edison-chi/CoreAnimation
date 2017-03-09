//
//  BlockExecutor.h
//  coreAnimation
//
//  Created by apple on 17/3/7.
//  Copyright © 2017年 Mr.chi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^voidBlock)(void);

@interface BlockExecutor : NSObject{
    voidBlock _block;
}

- (instancetype)initWithBlock:(voidBlock) block;

@end
