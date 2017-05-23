//
//  MVCController.m
//  MCLearnDemo1
//
//  Created by MC on 2017/4/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MVCController.h"
#import "MVCView.h"
#import "MVCMode.h"

@interface MVCController ()<MVCViewDelegate>

@property(strong,nonatomic)MVCView *myView;
@property(strong,nonatomic)MVCMode *myMode;

@end

@implementation MVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.myView=[MVCView new];
    self.myView.frame=self.view.frame;
    self.myView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.myView];
    self.myView.delegate=self;
    
    self.myMode=[MVCMode new];
    self.myMode.name=@"小李";
    self.myMode.age=@"18";
    self.myMode.sex=@"男";

    [self printPapaer];
    [self setValueOnView];
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

-(void)printPapaer{

    [self.myView printOnView:self.myMode];
}

-(void)setValueOnView{
    
    [self.myView setValueOnView:self.myMode];
}


#pragma mark MVCViewDelegate
-(void)onPrintBtnClick{

    int rand=arc4random()%60;
//    self.myMode.name=[NSString stringWithFormat:@"MVC-小李_%d",rand];
//    self.myMode.age=[NSString stringWithFormat:@"MVC-%d",rand];

    self.myMode.name=[NSString stringWithFormat:@"MVC-小李_%d",rand];
    self.myMode.age=[NSString stringWithFormat:@"MVC-%d",rand];

    [self.myView printOnView:self.myMode];
}

-(void)onGetBtnCLick{
    self.myMode=[self.myView getValueOnView];
    [self.myView setContent:self.myMode];
}




@end
