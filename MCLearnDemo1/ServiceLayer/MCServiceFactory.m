//
//  MCServiceFactory.m
//  MCLearnDemo1
//
//  Created by MC on 2017/5/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MCServiceFactory.h"

@implementation MCServiceFactory

+(instancetype)sharedInstance{

    static MCServiceFactory *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [MCServiceFactory new];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mvpService = [MCMVPService new];
    }
    return self;
}
@end
