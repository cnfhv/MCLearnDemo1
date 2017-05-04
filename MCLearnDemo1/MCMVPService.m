//
//  MCPrintService.m
//  MCLearnDemo1
//
//  Created by MC on 2017/5/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MCMVPService.h"
#import "MCDataAccessFactory.h"

@implementation MCMVPService

-(MVPMode*)getMVPModel{

    //从数据层获取模型
    MVPMode *model = [[MCDataAccessFactory staredInstance].mvpDAO getMVPMode];
//    model.name=@"小李";
//    model.age=@"18";
//    model.sex=@"男";
    
    return model;
}

@end
