//
//  RootViewController.m
//  LessonDouBan
//
//  Created by CLT on 16/6/28.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "RootViewController.h"
#import "DouBanTabBar.h"

@interface RootViewController ()<DouBanTabBarDeleage>
@property (nonatomic, strong) DouBanTabBar *dbTabBar;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"paper.png"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"paperH.png"] forState:UIControlStateSelected];
    btn1.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 15, 0);
    [btn1 setTitle:@"活动" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, -60, -30, 0)];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
//    btn1.backgroundColor = [UIColor greenColor];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"video.png"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"videoH.png"] forState:UIControlStateSelected];
    btn2.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 15, 0);
    [btn2 setTitle:@"电影" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn2 setTitleEdgeInsets:UIEdgeInsetsMake(0, -60, -30, 0)];
    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];

//    btn2.backgroundColor = [UIColor greenColor];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setImage:[UIImage imageNamed:@"2image.png"] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"2imageH.png"] forState:UIControlStateSelected];
    btn3.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 15, 0);
    [btn3 setTitle:@"影院" forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn3 setTitleEdgeInsets:UIEdgeInsetsMake(0, -60, -30, 0)];
    [btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];

    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 setImage:[UIImage imageNamed:@"person.png"] forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"personH.png"] forState:UIControlStateSelected];
    btn4.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 15, 0);
    [btn4 setTitle:@"我的" forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn4 setTitleEdgeInsets:UIEdgeInsetsMake(0, -60, -30, 0)];
    [btn4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];

    
    self.dbTabBar = [[DouBanTabBar alloc] initWithItems:@[btn1, btn2, btn3, btn4] frame:CGRectMake(0, WindowHeight - 49, WindownWidth, 49)];
    self.dbTabBar.doubanDelegate = self;
    NSLog(@"frame = %@", NSStringFromCGRect(self.dbTabBar.frame));
    [self.view addSubview:self.dbTabBar];
    self.selectedIndex = self.dbTabBar.currentSelected;
    
}

- (void)douBanItemDidClicked:(DouBanTabBar *)tabBar
{
    self.selectedIndex = tabBar.currentSelected;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
