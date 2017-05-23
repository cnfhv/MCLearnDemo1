//
//  MCRunTimeVC.m
//  MCLearnDemo1
//
//  Created by MC on 2017/5/22.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MCRunTimeVC.h"
#import <objc/message.h>

@interface MCRunTimeVC ()

@end

@implementation MCRunTimeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    NSLog(@"MCRunTimeVC:%@",[self description]);
    MCLog([self description]);
    /*
     isKindOfClass:和 isMemberOfClass:则检查对象是否在指定的类继承体系中
     respondsToSelector:检查对象能否响应指定的消息
     conformsToProtocol: 检查对象是否实现了指定协议类的方法
     methodForSelector:则返回指定方法实现的地址
     */
    
    /*
     禁止UINavigationController右滑动
     */
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets{
    NSLog(@"左滑动");
}



@end
