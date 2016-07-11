//
//  TheaterModel.h
//  LessonDouBan
//
//  Created by CLT on 16/6/28.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseModel.h"

@interface TheaterModel : BaseModel
//影院编号
@property(nonatomic,copy)NSString *ID;
//影院所在地城市名
@property(nonatomic,copy)NSString *cityName;
//影院名
@property(nonatomic,copy)NSString *cinemaName;
//影院地址
@property(nonatomic,copy)NSString *address;
//电话号码
@property(nonatomic,assign)NSInteger telephone;
//纬度
@property(nonatomic,copy)NSString *latitude;
//经度
@property(nonatomic,copy)NSString *longitude;
//交通路线
@property(nonatomic,copy)NSString *trafficRoutes;
@end
