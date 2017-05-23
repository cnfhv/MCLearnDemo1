//
//  MVVMViewMode.h
//  MCLearnDemo1
//
//  Created by MC on 2017/4/13.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MVVMMode;

@interface MVVMViewMode : NSObject

@property(nonatomic,strong)NSString *nameString;
@property(nonatomic,strong)NSString *ageString;
@property(nonatomic,strong)NSString *sexString;
@property(nonatomic,strong)NSString *contentString;

-(void)onPrintClick;
-(void)setWithMode:(MVVMMode*)mode;


-(void)setPrintClick;

@end
