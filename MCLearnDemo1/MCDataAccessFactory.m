//
//  MCDataAccessFactory.m
//  MCLearnDemo1
//
//  Created by MC on 2017/5/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MCDataAccessFactory.h"

@interface MCDataAccessFactory()

@end

@implementation MCDataAccessFactory

+(instancetype)staredInstance{

    static MCDataAccessFactory *instance=nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [MCDataAccessFactory new];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mvpDAO = [MCMVPDAO new];
    }
    return self;
}

@end
