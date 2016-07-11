//
//  MovieModel.h
//  LessonDouBan
//
//  Created by CLT on 16/6/28.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseModel.h"

@interface MovieModel : BaseModel

//电影评分
@property(nonatomic,copy) NSString *rating;
//上映日期
@property(nonatomic,copy) NSString *pubdate;
//电影名称
@property(nonatomic,copy) NSString *title;
//评分数
@property(nonatomic,assign) NSInteger *wish;
//原始标题
@property(nonatomic,copy) NSString *original_title;
//收藏数
@property(nonatomic,copy) NSString *collection;
//星级
@property(nonatomic,copy) NSString *stars;
//所有图片
@property(nonatomic,copy) NSDictionary *images;
//大图片
@property(nonatomic,copy) NSString *large;
//小图片
@property(nonatomic,copy) NSString *small;
//中等图片
@property(nonatomic,copy) NSString *medium;
//电影编号
@property(nonatomic,copy) NSString *ID;

@end
