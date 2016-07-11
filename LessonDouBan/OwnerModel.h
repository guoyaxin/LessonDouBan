//
//  OwnerModel.h
//  LessonDouBan
//
//  Created by CLT on 16/6/27.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseModel.h"

@interface OwnerModel : BaseModel
//名字
@property (nonatomic, copy) NSString *name;
//头像
@property (nonatomic, copy) NSString *avatar;
//uid
@property (nonatomic, copy) NSString *uid;
//购买票的推荐网址
@property (nonatomic, copy) NSString *alt;
//类型
@property (nonatomic, copy) NSString *type;
//ID
@property (nonatomic, copy) NSString *ID;
//大头像
@property (nonatomic, copy) NSString *large_avatar;
@end
