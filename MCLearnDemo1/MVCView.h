//
//  MVCView.h
//  MCLearnDemo1
//
//  Created by MC on 2017/4/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MVCMode;

@protocol MVCViewDelegate <NSObject>

-(void)onPrintBtnClick;
-(void)onGetBtnCLick;

@end

@interface MVCView : UIView

-(void)printOnView:(MVCMode*)mode;

@property(nonatomic,weak)id<MVCViewDelegate> delegate;

-(void)setValueOnView:(MVCMode*)mode;

-(MVCMode*)getValueOnView;

-(void)setContent:(MVCMode *)mode;

@end
