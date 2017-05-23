//
//  MCZBarView.h
//  Psy
//
//  Created by MC on 2017/4/28.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MCZBarViewDelegate <NSObject>

-(void)onClickBack;

@end

@interface MCZBarView : UIView

@property(weak,nonatomic)id<MCZBarViewDelegate> delegate;

@property(strong,nonatomic)UILabel * labIntroudction;
@end
