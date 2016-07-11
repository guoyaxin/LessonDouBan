//
//  ActivityModel.h
//  LessonDouBan
//
//  Created by CLT on 16/6/27.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseModel.h"
#import "OwnerModel.h"
//@class OwnerModel;

@interface ActivityModel : BaseModel

//活动的分类
@property (nonatomic, copy) NSString *subcategory_name;
//显示的图片
@property (nonatomic, copy) NSString *image;
//活动信息（网页版）
@property (nonatomic, copy) NSString *adapt_url;
//活动所在地
@property (nonatomic, copy) NSString *loc_name;
//活动发布者
@property (nonatomic, strong) OwnerModel *user;
//购票网址
@property (nonatomic, copy) NSString *alt;

//活动ID
@property (nonatomic, copy) NSString *ID;
//类别
@property (nonatomic, copy) NSString *category;
// 标题
@property (nonatomic, copy) NSString *title;
// 评论数
@property (nonatomic, assign) NSInteger wisher_count;
// 是否有票
@property (nonatomic, assign) BOOL has_ticket;
// 活动内容
@property (nonatomic, copy) NSString *content;
// 是否邀请
@property (nonatomic, copy) NSString *can_invite;
// 唱片集
@property (nonatomic, copy) NSString *album;
// 参与人数
@property (nonatomic, assign) NSInteger participant_count;
// 标签
@property (nonatomic, copy) NSString *tags;
//
@property (nonatomic, copy) NSString *image_hlarge;
// 所有剧照信息
@property (nonatomic, strong) NSArray *photos;
// 活动开始时间
@property (nonatomic, copy) NSString *begin_time;
//
@property (nonatomic, copy) NSString *price_range;
//
@property (nonatomic, copy) NSString *geo;
//
@property (nonatomic, copy) NSString *image_lmobile;
//
@property (nonatomic, copy) NSString *category_name;
//
@property (nonatomic, copy) NSString *loc_id;
// 活动结束时间
@property (nonatomic, copy) NSString *end_time;
// 活动地址
@property (nonatomic,
           copy) NSString *address;
@end
