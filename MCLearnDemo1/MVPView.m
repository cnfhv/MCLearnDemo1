//
//  MVPView.m
//  MCLearnDemo1
//
//  Created by MC on 2017/4/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MVPView.h"

@interface MVPView()

@property(nonatomic,strong)UITextField *nameL;
@property(nonatomic,strong)UITextField *ageL;
@property(nonatomic,strong)UITextField *sexL;
@property(nonatomic,strong)UIButton *btnPrint;

@property(nonatomic,strong)UIButton *btnGet;
@property(nonatomic,strong)UILabel *contentL;


@end

@implementation MVPView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView{
    
    self.backgroundColor=[UIColor lightGrayColor];

    self.btnPrint=[UIButton new];
    self.btnPrint.frame=CGRectMake(20, 100, 100, 30);
    [self addSubview:self.btnPrint];
    [self.btnPrint setTitle:@"设置" forState:UIControlStateNormal];
    [self.btnPrint addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchDown];
    self.btnPrint.backgroundColor=[UIColor grayColor];
    
    self.nameL=[[UITextField alloc] initWithFrame:CGRectMake(20, 150, 300, 30)];
    [self addSubview:self.nameL];
    self.nameL.backgroundColor=[UIColor grayColor];
    
    
    self.ageL=[[UITextField alloc] initWithFrame:CGRectMake(20, 200, 300, 30)];
    [self addSubview:self.ageL];
    self.ageL.backgroundColor=[UIColor grayColor];
    
    self.sexL=[[UITextField alloc] initWithFrame:CGRectMake(20, 250, 300, 30)];
    [self addSubview:self.sexL];
    self.sexL.backgroundColor=[UIColor grayColor];
    
    
    self.btnGet=[UIButton new];
    self.btnGet.frame=CGRectMake(20, 300, 350, 30);
    [self addSubview:self.btnGet];
    [self.btnGet setTitle:@"获取" forState:UIControlStateNormal];
    [self.btnGet addTarget:self action:@selector(getValueClick) forControlEvents:UIControlEventTouchDown];
    self.btnGet.backgroundColor=[UIColor grayColor];
    
    self.contentL=[[UILabel alloc] initWithFrame:CGRectMake(20, 350, 300, 30)];
    [self addSubview:self.contentL];

}

-(void)setValueOnView:(NSDictionary*)dict{
    
    [self.nameL setText:[dict objectForKey:@"name"]];
    [self.ageL setText:[dict objectForKey:@"age"]];
    [self.sexL setText:[dict objectForKey:@"sex"]];

}

-(NSDictionary*)getValueOnView{

    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setValue:_nameL.text forKey:@"name"];
    [dict setValue:_ageL.text forKey:@"age"];
    [dict setValue:_sexL.text forKey:@"sex"];
    
    return dict;
}

-(void)onPrintClick{
    if (_delegate) {
        [_delegate onPrintBtnClick];
    }
}


-(void)getValueClick{
    
    if (_delegate) {
        [_delegate onGetBtnCLick];
    }
}

-(void)setContent:(NSDictionary *)dict{

    [self.contentL setText:[NSString stringWithFormat:@"%@--%@--%@",[dict objectForKey:@"name"],[dict objectForKey:@"age"],[dict objectForKey:@"sex"]]];

}

@end
