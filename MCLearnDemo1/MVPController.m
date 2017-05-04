//
//  MVPController.m
//  MCLearnDemo1
//
//  Created by MC on 2017/4/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MVPController.h"
#import "MVPPresenter.h"
#import "MVPView.h"
#import "MCServiceFactory.h"

@interface MVPController ()

@property(nonatomic,strong)MVPPresenter* mvpPresenter;
@property(nonatomic,strong)MVPView* mvpView;
@property(nonatomic,strong)MVPMode* mvpMode;


@end

@implementation MVPController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mvpPresenter=[MVPPresenter new];
    
    self.mvpView=[MVPView new];
    _mvpView.frame=self.view.frame;
    [self.view addSubview:self.mvpView];
    _mvpView.delegate=_mvpPresenter;
    
//    self.mvpMode=[MVPMode new];
//    _mvpMode.name=@"小李";
//    _mvpMode.age=@"18";
//    _mvpMode.sex=@"男";
    
    //从ServiceLayer获取model
    self.mvpMode=[[MCServiceFactory sharedInstance].mvpService getMVPModel];
    
    _mvpPresenter.mvpView=_mvpView;
    _mvpPresenter.mvpMode=_mvpMode;
    [_mvpPresenter setValueView];
    
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
