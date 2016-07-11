//
//  TheaterRequest.m
//  LessonDouBan
//
//  Created by CLT on 16/6/28.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "TheaterRequest.h"

@implementation TheaterRequest

- (void)theaterRequestWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{

    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestWithUrl:TheaterRequest_Url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

@end
