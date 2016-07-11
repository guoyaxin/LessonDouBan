//
//  NetWorkRequest.h
//  LessonDouBan
//
//  Created by CLT on 16/6/27.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseRequest.h"
//成功回调
typedef void(^SuccessResponse)(NSDictionary *dic);
//失败回调
typedef void(^FailureResponse)(NSError *error);

@interface NetWorkRequest : BaseRequest

/*请求数据
 @url:请求数据的url
 @parameterDic：请求的参数
 @success：成功回调的block
 @failure：失败回调的block
 */
- (void)requestWithUrl:(NSString *)url
            parameters:(NSDictionary *)parameterDic
       successResponse:(SuccessResponse)success
       failureResponse:(FailureResponse)failure;


- (void)sendDataWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
        successResponse:(SuccessResponse)success
                failure:(FailureResponse) failure;



















- (void)sendImageWithUrl:(NSString *)url
              parameter:(NSDictionary *)parameterDic
                  image:(UIImage *)uploadImage
        successResponse:(SuccessResponse)success
        failureResponse:(FailureResponse)failure;


@end
