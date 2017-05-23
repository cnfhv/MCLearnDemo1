//
//  MCServiceFactory.h
//  MCLearnDemo1
//
//  Created by MC on 2017/5/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCMVPService.h"

@interface MCServiceFactory : NSObject

+(instancetype)sharedInstance;

@property(nonatomic,strong)MCMVPService *mvpService;

@end
