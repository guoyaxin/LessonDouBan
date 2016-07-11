//
//  LoginViewController.m
//  LessonDouBan
//
//  Created by CLT on 16/6/29.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginRequest.h"
#import "RegisterViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)loginBtnClicked:(UIButton *)sender {
    //登录
    [self login];
}
- (IBAction)registerBtnClicked:(UIButton *)sender {
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    RegisterViewController *registerVC = [mainSb instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    
    [self presentViewController:registerVC animated:YES completion:^{
        
    }];
}

- (void)login
{
    //验证，判读用户名密码
    if([self.usernameTextField.text length] == 0 )
    {
        NSLog(@"用户名为空！");
    }
    else if ([self.passwordTextField.text length] == 0)
    {
        NSLog(@"密码为空！");
    }
    else {
        LoginRequest *request = [[LoginRequest alloc] init];
        [request loginRequestWithUsername:self.usernameTextField.text password:self.passwordTextField.text success:^(NSDictionary *dic) {
            NSLog(@"login success = %@", dic);
            NSString *code = [[dic objectForKey:@"code"] stringValue];
            if ([code isEqualToString:@"1103"]) {
                NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
                NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
                //保存头像和id到本地
                [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
                [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                //登录成功之后消失
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
            }
            
        } failure:^(NSError *error) {
            NSLog(@"login error = %@", error);
        }];

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

@end
