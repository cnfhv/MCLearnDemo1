//
//  MCZXingVC.h
//  MCZXingDemo
//
//  Created by MC on 2017/5/10.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MCZXingVCDelegate <NSObject>

-(void)readResults:(NSString*)results;

@end

@interface MCZXingVC : UIViewController

@property(weak,nonatomic)id<MCZXingVCDelegate> delegate;

@end
