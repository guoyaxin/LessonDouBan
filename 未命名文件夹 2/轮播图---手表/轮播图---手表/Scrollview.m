//
//  Scrollview.m
//  轮播图---手表
//
//  Created by lanou3g on 16/6/21.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "Scrollview.h"

@implementation Scrollview

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAll];
    }
    return self;
}
-(void)addAll{
    self.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*5, 0);
    self.pagingEnabled = YES;
    for (int i = 0; i < 5; i++) {
        UIImageView *imageV =[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*0.3)];
        imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        [self addSubview:imageV];
    }
}

@end
