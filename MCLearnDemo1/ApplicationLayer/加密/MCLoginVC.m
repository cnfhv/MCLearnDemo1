//
//  MCLoginVC.m
//  MCLearnDemo1
//
//  Created by MC on 2017/5/8.
//  Copyright © 2017年 MC. All rights reserved.
//

/*
 加盐(盐要足够长，足够复杂)
 缺点:开发人员最清楚这个盐
 */

#define SALT @"!@#$%^&*(TUYTDFLKJHJFUYTDT&%^&%*FDTYCVB&*&E*UOILYGVKHJKP"

/*
 HMAC加密
 密钥：1.在真实的开发中，这个"SecretKey"密钥是从服务器随机获取的
      2.而且是一个账号对应一个SecretKey
 */
#define SecretKey @"cnfhv"

/*
 APP唯一标示
 */
#define APPKey @"com.mc.learn"


#import "MCLoginVC.h"
#import <MBProgressHUD.h>
#import "NSString+Hash.h"
#import "SSKeychain.h"

@interface MCLoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *userTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
- (IBAction)onClickLogin:(id)sender;

@end

@implementation MCLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self loadUserInfo];
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

- (IBAction)onClickLogin:(id)sender {
    
    NSString *userStr=_userTF.text;
    NSString *pwdStr=_pwdTF.text;
    NSLog(@"原始密码：%@",pwdStr);
    //加密处理-MD5
    pwdStr=pwdStr.md5String;
    NSLog(@"MD5加密后：%@",pwdStr);
    
    NSString *pwdStrSalt=_pwdTF.text;
    //加盐-MD5
    pwdStrSalt=[pwdStrSalt stringByAppendingString:SALT].md5String;
    NSLog(@"MD5加盐加密后：%@",pwdStrSalt);

    /*
     HMAC加密方案
     1.从服务器申请密钥(HMAC)
     2.对密码做HMAC加密
     3.将加密结果给服务器
     4.本地保存HMAC的密钥
     
    */
    NSString *pwdStrHmac=_pwdTF.text;
    //在真实的开发中，这个"SecretKey"密钥是从服务器随机获取的
    //而且是一个账号对应一个SecretKey
    pwdStrHmac=[pwdStrHmac hmacMD5StringWithKey:SecretKey];
    NSLog(@"HMAC加密后：%@",pwdStrHmac);
    
    /*
     HMAC更安全
     用户密码+Key 获取HMAC密码
     HMAC密码+当前年月日时分+MD5加密(当前年月日时分最好从服务器获取)
     密码有效验证时间是2分钟
     */
    NSString *pwdStrHmac1=_pwdTF.text;
    //在真实的开发中，这个"SecretKey"密钥是从服务器随机获取的
    //而且是一个账号对应一个SecretKey
    pwdStrHmac1=[pwdStrHmac1 hmacMD5StringWithKey:SecretKey];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"当前时间：%@",currentDateStr);
    pwdStrHmac1=[pwdStrHmac1 stringByAppendingString:currentDateStr].md5String;
    NSLog(@"HMAC+当前时间+MD5加密后：%@",pwdStrHmac1);


    [self sendLogin:userStr PWD:pwdStrHmac];
    
}


-(void)sendLogin:(NSString*)userID PWD:(NSString*)password{

    if (userID!=0 && password!=0) {
        
        //模拟网络请求
//        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(3);
            if ([userID isEqualToString:@"mc"] && [password isEqualToString:@"4c855a6fe18b901c07e9a8b301f29f54"]) {
                [self savaUserID:userID passWord:password];
                //刷新界面
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSLog(@"登录成功");
                });
            }
        });
    }
}

-(void)savaUserID:(NSString*)userID passWord:(NSString*)passWord{

    [[NSUserDefaults standardUserDefaults] setObject:userID forKey:@"userID"];
    
    //保存密码一
    [[NSUserDefaults standardUserDefaults] setObject:_pwdTF.text forKey:@"password"];
    //保存密码二 安全性更高
    [SSKeychain setPassword:_pwdTF.text forService:APPKey account:userID];
    
}

-(void)loadUserInfo{

    _userTF.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"];
    _pwdTF.text=[SSKeychain passwordForService:APPKey account:_userTF.text];

}

@end
