//
//  MyHeaderTableViewCell.h
//  LessonDouBan
//
//  Created by CLT on 16/6/29.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <UIKit/UIKit.h>
//MyHeaderTableViewCell 的重用标识符
#define MyHeaderTableViewCell_Identify @"MyHeaderTableViewCell_Identify"

@interface MyHeaderTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;


@end
