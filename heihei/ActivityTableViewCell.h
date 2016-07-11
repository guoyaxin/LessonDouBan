//
//  ActivityTableViewCell.h
//  LessonDouBan
//
//  Created by CLT on 16/6/30.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

//ActivityTableViewCell 的重用标识符
#define ActivityTableViewCell_Identify @"ActivityTableViewCell_Identify"

@interface ActivityTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *activityTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *interestingNumberLabel;

@property (strong, nonatomic) IBOutlet UILabel *joinNumberLabel;
@property (strong, nonatomic) IBOutlet UIImageView *activityImageView;

@property (strong, nonatomic) ActivityModel *model;

@end
