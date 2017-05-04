//
//  ViewController.m
//  MCLearnDemo1
//
//  Created by MC on 2017/4/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "ViewController.h"
#import "MVCController.h"
#import "MVPController.h"
#import "MVVMController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.dataArray=@[@"MVC",@"MVP",@"MVVM",@"NSThread",@"GCD",@"NSOperation"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *cellID=@"mc";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (cell==nil) {
         cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    [cell.textLabel setText:self.dataArray[indexPath.row]];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *view=[[UIView alloc] init];
    view.backgroundColor=[UIColor redColor];
    return  view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self showMVC];
            break;
        case 1:
            [self showMVP];
            break;
        case 2:
            [self showMVVM];
            break;

        default:
            break;
    }
}

-(void)showMVC{

    MVCController *mvcC=[MVCController new];
    mvcC.title=[self.dataArray objectAtIndex:0];
    [self.navigationController pushViewController:mvcC animated:YES];
}

-(void)showMVP{

    MVPController *mvpC=[MVPController new];
    mvpC.title=[self.dataArray objectAtIndex:1];
    [self.navigationController pushViewController:mvpC animated:YES];
}

-(void)showMVVM{

    MVVMController *mvvmController=[MVVMController new];
    mvvmController.title=[self.dataArray objectAtIndex:2];
    [self.navigationController pushViewController:mvvmController animated:YES];
}

@end
