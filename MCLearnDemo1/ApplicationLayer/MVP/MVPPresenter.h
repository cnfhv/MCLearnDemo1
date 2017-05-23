//
//  MVPPresenter.h
//  MCLearnDemo1
//
//  Created by MC on 2017/4/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPView.h"
#import "MVPMode.h"

@interface MVPPresenter : NSObject

@property(nonatomic,strong)MVPView *mvpView;
@property(nonatomic,strong)MVPMode *mvpMode;

-(void)setValueView;

-(void)getValueView;

@end
