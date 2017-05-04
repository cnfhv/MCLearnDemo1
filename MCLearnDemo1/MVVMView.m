//
//  MVVMView.m
//  MCLearnDemo1
//
//  Created by MC on 2017/4/13.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MVVMView.h"
#import "MVVMMode.h"
#import "FBKVOController.h"
#import "NSObject+FBKVOController.h"
#import "MVVMViewMode.h"

@interface MVVMView ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *nameL;
@property(nonatomic,strong)UITextField *ageL;
@property(nonatomic,strong)UITextField *sexL;
@property(nonatomic,strong)UIButton *btnPrint;

@property(nonatomic,strong)UIButton *btnGet;
@property(nonatomic,strong)UILabel *contentL;

@property(nonatomic,strong)MVVMViewMode *myViewMode;


@end

@implementation MVVMView

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
    self.nameL.delegate=self;
    self.nameL.tag=101;
    
    self.ageL=[[UITextField alloc] initWithFrame:CGRectMake(20, 200, 300, 30)];
    [self addSubview:self.ageL];
    self.ageL.backgroundColor=[UIColor grayColor];
    self.ageL.delegate=self;
    self.ageL.tag=102;

    self.sexL=[[UITextField alloc] initWithFrame:CGRectMake(20, 250, 300, 30)];
    [self addSubview:self.sexL];
    self.sexL.backgroundColor=[UIColor grayColor];
    self.sexL.delegate=self;
    self.sexL.tag=103;

    self.btnGet=[UIButton new];
    self.btnGet.frame=CGRectMake(20, 300, 350, 30);
    [self addSubview:self.btnGet];
    [self.btnGet setTitle:@"获取" forState:UIControlStateNormal];
    [self.btnGet addTarget:self action:@selector(getValueClick) forControlEvents:UIControlEventTouchDown];
    self.btnGet.backgroundColor=[UIColor grayColor];
    
    self.contentL=[[UILabel alloc] initWithFrame:CGRectMake(20, 350, 300, 30)];
    [self addSubview:self.contentL];

}

-(void)setWithViewMode:(MVVMViewMode *)vm{

    self.myViewMode=vm;
    
    /*
    [self.KVOController observe:vm keyPath:@"nameString" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary * change) {
        
        NSString *str = [change objectForKey:NSKeyValueChangeNewKey];
        _nameL.text=str;
        
    }];
     */
    
    [self.KVOController observe:vm keyPaths:@[@"nameString",@"ageString",@"sexString"] options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        
//        NSString *nameStr = [change objectForKey:NSKeyValueChangeNewKey];
//        _nameL.text=nameStr;
        MVVMView *view=(MVVMView*)observer;
        MVVMViewMode *viewMode=(MVVMViewMode*)object;
        view.nameL.text=viewMode.nameString;
        view.ageL.text=viewMode.ageString;
        view.sexL.text=viewMode.sexString;

    }];
}

-(void)setWithViewContent:(MVVMViewMode *)vm{

    [self.KVOController observe:vm keyPath:@"contentString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        NSString *contentStr = [change objectForKey:NSKeyValueChangeNewKey];
        _contentL.text=contentStr;

    }];
}


-(void)onPrintClick{
    
    [self.myViewMode onPrintClick];
}

-(void)getValueClick{
    
    [self.myViewMode setPrintClick];

}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    NSString *searchText;
    if (range.length == 0) {// +
        searchText = [textField.text stringByAppendingString:string];
    } else if (range.length == 1) {// -
        searchText = [textField.text substringToIndex:range.location];
    }

//    if ([textField isKindOfClass:[_nameL class]]) {
//        self.myViewMode.nameString=textField.text;
//        
//    }else if ([textField isKindOfClass:[_ageL class]]){
//        self.myViewMode.nameString=textField.text;
//    }
    switch ([textField tag]) {
        case 101:
            self.myViewMode.nameString=textField.text;
            break;
        case 102:
            self.myViewMode.ageString=textField.text;
            break;
        case 103:
            self.myViewMode.sexString=textField.text;
            break;
        default:
            break;
    }
    [self.myViewMode setPrintClick];
    
    return YES;

}

@end
