//
//  MVVMController.m
//  MCLearnDemo1
//
//  Created by MC on 2017/4/13.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MVVMController.h"
#import "MVVMMode.h"
#import "MVVMView.h"
#import "MVVMViewMode.h"

@interface MVVMController ()

@property(strong,nonatomic)MVVMMode *mvvmMode;
@property(strong,nonatomic)MVVMView *mvvmView;
@property(strong,nonatomic)MVVMViewMode *mvvmViewMode;

@end

@implementation MVVMController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mvvmMode=[MVVMMode new];
    self.mvvmMode.name=@"小超";
    self.mvvmMode.age=@"22";
    self.mvvmMode.sex=@"男";
    self.mvvmMode.content=@"";
    
    self.mvvmViewMode=[MVVMViewMode new];
    [self.mvvmViewMode setWithMode:_mvvmMode];
    
    self.mvvmView=[MVVMView new];
    self.mvvmView.frame=self.view.bounds;
    [self.mvvmView setWithViewMode:_mvvmViewMode];
    [self.mvvmView setWithViewContent:_mvvmViewMode];

    [self.view addSubview:_mvvmView];
    
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

@end
