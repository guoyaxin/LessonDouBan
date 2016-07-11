//
//  LoginRequest.m
//  LessonDouBan
//
//  Created by CLT on 16/6/29.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest

- (void)loginRequestWithUsername:(NSString *)username password:(NSString *)password success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request sendDataWithUrl:LoginRequest_Url parameters:@{@"userName":username, @"password": password} successResponse:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
