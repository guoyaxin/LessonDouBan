//
//  MyTableViewCell.h
//  LessonDouBan
//
//  Created by CLT on 16/6/29.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <UIKit/UIKit.h>
//我的cell 的重用标识符
#define MyTableViewCell_Identify @"MyTableViewCell_Identify"

@interface MyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UILabel *subContentLabel;


@end
