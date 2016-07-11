//
//  ActivityRequest.m
//  LessonDouBan
//
//  Created by CLT on 16/6/27.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "ActivityRequest.h"

@implementation ActivityRequest

- (void)activityRequestParameter:(NSDictionary *)parameterDic success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestWithUrl:ActivityRequest_Url parameters:parameterDic successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

@end
