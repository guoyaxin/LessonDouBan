//
//  TheaterViewController.m
//  LessonDouBan
//
//  Created by CLT on 16/6/28.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "TheaterViewController.h"
//显示地图
#import "TheaterMapViewController.h"

#import "TheaterTableViewCell.h"
#import "TheaterRequest.h"
#import "TheaterModel.h"
@interface TheaterViewController ()
@property (strong, nonatomic) IBOutlet UITableView *theaterTableView;
@property (strong, nonatomic) NSMutableArray *theaters;
@end

@implementation TheaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.theaters = [NSMutableArray array];
    // Do any additional setup after loading the view.
    [self.theaterTableView registerNib:[UINib nibWithNibName:@"TheaterTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:TheaterTableViewCell_Idetity];
    [self requestTheaterData];
}

- (void)requestTheaterData
{
    TheaterRequest *request = [[TheaterRequest alloc] init];
    [request theaterRequestWithParameter:nil success:^(NSDictionary *dic) {
        NSLog(@"succes = %@", dic);
        NSArray *arr = [[dic objectForKey:@"result"] objectForKey:@"data"];
        for (NSDictionary *tempDic in arr) {
            TheaterModel *model = [[TheaterModel alloc] init];
            [model setValuesForKeysWithDictionary:tempDic];
            [self.theaters addObject:model];
        }
        [self.theaterTableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"error = %@", error);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.theaters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TheaterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TheaterTableViewCell_Idetity];
    TheaterModel *model = self.theaters[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    TheaterMapViewController *mapVC = [[TheaterMapViewController alloc] init];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    TheaterMapViewController *mapVC = [[TheaterMapViewController alloc] init];
//    [self.navigationController pushViewController:mapVC animated:YES];
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
