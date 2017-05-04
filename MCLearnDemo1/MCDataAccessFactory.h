//
//  MCDataAccessFactory.h
//  MCLearnDemo1
//
//  Created by MC on 2017/5/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCMVPDAO.h"

@interface MCDataAccessFactory : NSObject

+(instancetype)staredInstance;

@property(nonatomic,strong)MCMVPDAO *mvpDAO;

@end
