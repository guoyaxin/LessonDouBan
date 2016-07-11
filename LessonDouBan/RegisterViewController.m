//
//  RegisterViewController.m
//  LessonDouBan
//
//  Created by CLT on 16/6/29.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterRequest.h"

@interface RegisterViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *avatorImagView;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)registerBtnClicked:(UIButton *)sender {
    RegisterRequest *request = [[RegisterRequest alloc] init];
    [request registerWithName:self.usernameTextField.text password:self.passwordTextField.text avator:[UIImage imageNamed:@"video.png"] success:^(NSDictionary *dic) {
        NSLog(@"register success = %@", dic);
        NSString *code = [[dic objectForKey:@"code"] stringValue];
        if ([code isEqualToString:@"1005"]) {
            NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
            NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
            //保存头像和id到本地
            [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            //界面消失
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }

    } failure:^(NSError *error) {
        NSLog(@"register failure = %@", error);
    }];
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
