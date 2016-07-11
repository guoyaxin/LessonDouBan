//
//  TheaterTableViewCell.m
//  LessonDouBan
//
//  Created by CLT on 16/7/1.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "TheaterTableViewCell.h"

@implementation TheaterTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(TheaterModel *)model
{
    self.titleLabel.text = model.cinemaName;
    self.addressLabel.text =[NSString stringWithFormat:@"%@%@",model.cityName, model.address] ;
    self.phoneLabel.text =[NSString stringWithFormat:@"%ld", model.telephone] ;
}

@end
