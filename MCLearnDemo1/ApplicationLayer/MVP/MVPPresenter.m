//
//  MVPPresenter.m
//  MCLearnDemo1
//
//  Created by MC on 2017/4/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MVPPresenter.h"

@interface MVPPresenter()<MVPViewDelegate>


@end

@implementation MVPPresenter

-(void)setValueView{

    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setValue:_mvpMode.name forKey:@"name"];
    [dict setValue:_mvpMode.age forKey:@"age"];
    [dict setValue:_mvpMode.sex forKey:@"sex"];
    
    [_mvpView setValueOnView:dict];

}

-(void)getValueView{

}

-(void)onPrintBtnClick{
    
    int rand=arc4random()%60;
    _mvpMode.name=[NSString stringWithFormat:@"MVP-小李_%d",rand];
    _mvpMode.age=[NSString stringWithFormat:@"%d",rand];
    _mvpMode.sex=[NSString stringWithFormat:@"%@",rand%2==0 ? @"男":@"女"];
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setValue:_mvpMode.name forKey:@"name"];
    [dict setValue:_mvpMode.age forKey:@"age"];
    [dict setValue:_mvpMode.sex forKey:@"sex"];
    
    [self.mvpView setValueOnView:dict];
}

-(void)onGetBtnCLick{
    
    NSDictionary *dataDict=[self.mvpView getValueOnView];
    [self.mvpView setContent:dataDict];
}

@end
