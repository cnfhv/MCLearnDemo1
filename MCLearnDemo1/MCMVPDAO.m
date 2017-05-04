//
//  MCMVPDAO.m
//  MCLearnDemo1
//
//  Created by MC on 2017/5/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MCMVPDAO.h"

@implementation MCMVPDAO


-(MVPMode*)getMVPMode{
    MVPMode *model = [MVPMode new];
    model.name=@"小李";
    model.age=@"18";
    model.sex=@"男";

    return model;
}

@end
