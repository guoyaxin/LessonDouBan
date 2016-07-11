//
//  ViewController.m
//  AFNetWking---
//
//  Created by lanou3g on 16/6/22.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //q启动烽火轮
 //[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    //网络监测 rebility;
    //开启网络监测
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    //打印数据
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%ld",status);
    }];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self getdome];
    [self postdome];
}

-(void)getdome{
    //1建立管理器
    AFHTTPRequestOperationManager *mge = [AFHTTPRequestOperationManager manager];
    //2设置返回数据的类型
    mge.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置请求方式
    NSString *strurl = [NSString stringWithFormat:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213"];
    [mge GET:strurl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",dic);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
    }];
    
    
    
}
-(void)postdome{
    //1建立管理器
    AFHTTPRequestOperationManager *mge = [AFHTTPRequestOperationManager manager];
    //2设置返回数据的类型
    mge.responseSerializer = [AFHTTPResponseSerializer serializer];
    //设置请求方式
    NSString *strurl = [NSString stringWithFormat:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213"];
    
    
    [mge POST:strurl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //情切成功
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"\t--------------\%@",dic);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
    [mge POST:strurl parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}

@end
