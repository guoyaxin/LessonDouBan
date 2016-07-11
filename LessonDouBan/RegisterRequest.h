//
//  RegisterRequest.h
//  LessonDouBan
//
//  Created by CLT on 16/6/29.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterRequest : NSObject

- (void)registerWithName:(NSString *)name password:(NSString *)password avator:(UIImage *)image success:(SuccessResponse)success failure:(FailureResponse)failure;

@end
