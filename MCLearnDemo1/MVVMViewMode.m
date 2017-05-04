//
//  MVVMViewMode.m
//  MCLearnDemo1
//
//  Created by MC on 2017/4/13.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MVVMViewMode.h"
#import "MVVMMode.h"

@interface MVVMViewMode ()

@property(strong,nonatomic)MVVMMode *mvvmMode;

@end

@implementation MVVMViewMode

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

-(void)initData{

}

-(void)onPrintClick{

    int rand=arc4random()%60;
    _mvvmMode.name=[NSString stringWithFormat:@"MVP-小李_%d",rand];
    _mvvmMode.age=[NSString stringWithFormat:@"%d",rand];
    _mvvmMode.sex=[NSString stringWithFormat:@"%@",rand%2==0 ? @"男":@"女"];
    self.nameString=self.mvvmMode.name;
    self.ageString=self.mvvmMode.age;
    self.sexString=self.mvvmMode.sex;

}

-(void)setWithMode:(MVVMMode *)mode{
    
    self.mvvmMode=mode;
    
    self.nameString=mode.name;
    self.ageString=mode.age;
    self.sexString=mode.sex;
    self.contentString=mode.content;

}


-(void)setPrintClick{
    
    self.contentString=[NSString stringWithFormat:@"%@--%@--%@",self.nameString,self.ageString,self.sexString];
}

@end







