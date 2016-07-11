//
//  MyTableViewCell.m
//  轮播图---手表
//
//  Created by lanou3g on 16/6/21.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addAll];
    }
    return self;
}
-(void)addAll{
    self.imageV = [[UIImageView alloc]init];
    [self addSubview:self.imageV];
    self.namelabel = [[UILabel alloc]init];
    [self addSubview:self.namelabel];
    self.rmlabel = [[UILabel alloc]init];
}
-(void)layoutSubviews{
    self.imageV.frame = CGRectMake(10, 10, self.contentView.frame.size.width*0.4, self.contentView.frame.size.height*0.8);
    self.namelabel.frame = CGRectMake(CGRectGetMaxX(self.imageV.frame)+20, CGRectGetMinY(self.imageV.frame), 90, 40);
    self.rmlabel.frame = CGRectMake(CGRectGetMinX(self.namelabel.frame), CGRectGetMaxY(self.namelabel.frame)+20, 90, 40);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
