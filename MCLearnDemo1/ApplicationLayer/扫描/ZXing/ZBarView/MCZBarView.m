//
//  MCZBarView.m
//  Psy
//
//  Created by MC on 2017/4/28.
//  Copyright © 2017年 MC. All rights reserved.
//

// RGB颜色
#define MyColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#import "MCZBarView.h"
#import "PureLayout.h"

@interface MCZBarView(){

    int num;
    BOOL upOrdown;
    NSTimer * timer;
    UIImageView * imageView;
}

@property (nonatomic, retain) UIImageView * line;

@end

@implementation MCZBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];

    }
    return self;
}

-(void)initView{

    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0.8 * self.frame.size.width, 0.8 * self.frame.size.width)];
    imageView.image = [UIImage imageNamed:@"contact_scanframe"];
    [self addSubview:imageView];
    [imageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self];
    [imageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100];
    [imageView autoSetDimensionsToSize:CGSizeMake(0.8 * self.frame.size.width, 0.8 * self.frame.size.width)];
    
    _labIntroudction= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 290, 30)];
    _labIntroudction.backgroundColor = [UIColor clearColor];
    _labIntroudction.textColor=[UIColor whiteColor];
    _labIntroudction.textAlignment = NSTextAlignmentCenter;
    _labIntroudction.text=@"将取景框对准二维码，即自动扫描";
    _labIntroudction.font=[UIFont systemFontOfSize:14];
    _labIntroudction.adjustsFontSizeToFitWidth=YES;
    _labIntroudction.minimumScaleFactor=0.5;
    _labIntroudction.backgroundColor = MyColor(80, 141, 251);

    [self addSubview:_labIntroudction];
    [_labIntroudction autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:imageView];
    [_labIntroudction autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:imageView];
    [_labIntroudction autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:imageView withOffset:8];
    
    UIButton *backButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 290, 30)];
    [backButton setTitle:@"取消" forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(onClickBack) forControlEvents:(UIControlEventTouchUpInside)];
    backButton.backgroundColor = MyColor(80, 141, 251);

    [self addSubview:backButton];
    [backButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:imageView];
    [backButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:imageView];
    [backButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_labIntroudction withOffset:20];

    upOrdown = NO;
    num =0;
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(50, 110, 220, 2)];
    _line.image = [UIImage imageNamed:@"line"];
    [self addSubview:_line];
    [_line autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:imageView withOffset:40];
    [_line autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:imageView withOffset:-40];
    [_line autoSetDimension:ALDimensionHeight toSize:2];
    [_line autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:imageView withOffset:10];

    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];

}

-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(CGRectGetMinX(_line.frame), 110+2*num, CGRectGetWidth(_line.frame), CGRectGetHeight(_line.frame));
        if (2 * num == CGRectGetHeight(imageView.frame) - 20) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake(CGRectGetMinX(_line.frame), 110+2*num, CGRectGetWidth(_line.frame), CGRectGetHeight(_line.frame));
        if (num == 0) {
            upOrdown = NO;
        }
    }
    
}

- (void)dealloc
{
    [timer invalidate];
}

-(void)onClickBack{
    if (_delegate) {
        [timer invalidate];
        [_delegate onClickBack];
    }
}

@end
