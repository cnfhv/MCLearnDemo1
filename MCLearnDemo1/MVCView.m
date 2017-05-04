//
//  MVCView.m
//  MCLearnDemo1
//
//  Created by MC on 2017/4/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MVCView.h"
#import "MVCMode.h"

@interface MVCView ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *nameL;
@property(nonatomic,strong)UITextField *ageL;
@property(nonatomic,strong)UITextField *sexL;
@property(nonatomic,strong)UIButton *btnPrint;

@property(nonatomic,strong)UIButton *btnGet;
@property(nonatomic,strong)UILabel *contentL;



@end

@implementation MVCView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView{

    self.btnPrint=[UIButton new];
    self.btnPrint.frame=CGRectMake(20, 100, 100, 30);
    [self addSubview:self.btnPrint];
    [self.btnPrint setTitle:@"设置" forState:UIControlStateNormal];
    [self.btnPrint addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchDown];
    self.btnPrint.backgroundColor=[UIColor grayColor];
    
    self.nameL=[[UITextField alloc] initWithFrame:CGRectMake(20, 150, 300, 30)];
    [self addSubview:self.nameL];
    self.nameL.backgroundColor=[UIColor grayColor];
    self.nameL.delegate=self;

    self.ageL=[[UITextField alloc] initWithFrame:CGRectMake(20, 200, 300, 30)];
    [self addSubview:self.ageL];
    self.ageL.backgroundColor=[UIColor grayColor];
    self.ageL.delegate=self;
    
    self.sexL=[[UITextField alloc] initWithFrame:CGRectMake(20, 250, 300, 30)];
    [self addSubview:self.sexL];
    self.sexL.backgroundColor=[UIColor grayColor];
    self.sexL.delegate=self;
    
    self.btnGet=[UIButton new];
    self.btnGet.frame=CGRectMake(20, 300, 350, 30);
    [self addSubview:self.btnGet];
    [self.btnGet setTitle:@"获取" forState:UIControlStateNormal];
    [self.btnGet addTarget:self action:@selector(getValueClick) forControlEvents:UIControlEventTouchDown];
    self.btnGet.backgroundColor=[UIColor grayColor];
    
    self.contentL=[[UILabel alloc] initWithFrame:CGRectMake(20, 350, 300, 30)];
    [self addSubview:self.contentL];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)printOnView:(MVCMode *)mode{
    [self.nameL setText:mode.name];
    [self.ageL setText:mode.age];

}

-(void)onPrintClick{
    if (_delegate) {
        [_delegate onPrintBtnClick];
    }
}

-(void)setValueOnView:(MVCMode *)mode{

    [self.nameL setText:mode.name];
    [self.ageL setText:mode.age];
    [self.sexL setText:mode.sex];

}

-(MVCMode*)getValueOnView{
    
    MVCMode *mode=[MVCMode new];
    mode.name=self.nameL.text;
    mode.age=self.ageL.text;
    mode.sex=self.sexL.text;
    
    return mode;
}

-(void)getValueClick{

    if (_delegate) {
        [_delegate onGetBtnCLick];
    }
}

-(void)setContent:(MVCMode *)mode{

    self.contentL.text=[NSString stringWithFormat:@"%@:%@:%@",mode.name,mode.age,mode.sex];
}

#pragma mark UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{

    
    if ([textField isMemberOfClass:[_nameL class]]) {
        
    }else if ([textField isMemberOfClass:[_ageL class]]){
    
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self endEditing:YES];
}
@end
