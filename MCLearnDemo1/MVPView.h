//
//  MVPView.h
//  MCLearnDemo1
//
//  Created by MC on 2017/4/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MVPViewDelegate <NSObject>

-(void)onPrintBtnClick;
-(void)onGetBtnCLick;


@end
@interface MVPView : UIView

-(void)setValueOnView:(NSDictionary*)dict;

-(NSDictionary*)getValueOnView;

@property(nonatomic,weak)id<MVPViewDelegate> delegate;

-(void)setContent:(NSDictionary *)dict;

@end
