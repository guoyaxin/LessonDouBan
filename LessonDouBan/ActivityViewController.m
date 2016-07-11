//
//  ActivityViewController.m
//  LessonDouBan
//
//  Created by CLT on 16/6/28.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityRequest.h"
#import "ActivityDetailViewController.h"

@interface ActivityViewController ()

@property (strong, nonatomic) IBOutlet UITableView *activityTableView;
@property (strong, nonatomic) NSMutableArray *activities;

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.activityTableView registerNib:[UINib nibWithNibName:@"ActivityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ActivityTableViewCell_Identify];
    self.activities = [NSMutableArray array];
    [self requestActivityData];
}

- (void)requestActivityData
{
    __weak typeof(self) weakSelf = self;
    ActivityRequest *request = [[ActivityRequest alloc] init];
    [request activityRequestParameter:nil success:^(NSDictionary *dic) {
        NSArray *tempEvents = [dic objectForKey:@"events"];
        for (NSDictionary *tempDic in tempEvents) {
            ActivityModel *model = [[ActivityModel alloc] init];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.activities addObject:model];
        }
        NSLog(@"self.activities = %@", weakSelf.activities);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.activityTableView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"activity error = %@", error);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.activities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ActivityTableViewCell_Identify];
    ActivityModel *model = self.activities[indexPath.row];
    cell.model = model;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityModel *model = self.activities[indexPath.row];
    
    [self performSegueWithIdentifier:@"activityDetail" sender:model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"activityDetail"]) {
        ActivityDetailViewController *detailVC = segue.destinationViewController;
        detailVC.model = sender;
    }
}


@end
