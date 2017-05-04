//
//  MVVMView.h
//  MCLearnDemo1
//
//  Created by MC on 2017/4/13.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MVVMViewMode;

@interface MVVMView : UIView

-(void)setWithViewMode:(MVVMViewMode*)vm;

-(void)setWithViewContent:(MVVMViewMode *)vm;

@end
