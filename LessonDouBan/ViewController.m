//
//  ViewController.m
//  LessonDouBan
//
//  Created by CLT on 16/6/27.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "ViewController.h"
#import "ActivityRequest.h"
#import "ActivityDetailRequest.h"

#import "ActivityModel.h"

#import "MovieRequest.h"
#import "MovieDetailRequest.h"
#import "MovieModel.h"

#import "TheaterRequest.h"

@interface ViewController ()

//所有活动
@property (nonatomic, strong) NSMutableArray *activities;
//所有电影
@property (nonatomic, strong) NSMutableArray *movies;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.activities = [NSMutableArray array];
    self.movies = [NSMutableArray array];
    // Do any additional setup after loading the view, typically from a nib.
//    [self requetActivityData];
    [self requestActivityDetailDataWith:@"26865955"];
//    [self requestMovieData];
//    [self requestMovieDetailWithID:@"25662337"];
//    [self requestTheaterData];
}

- (void)requetActivityData
{
    __weak typeof(self) weakSelf = self;
    ActivityRequest *activity = [[ActivityRequest alloc] init];
    [activity activityRequestParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"success = %@", dic);
        NSArray *events = [dic objectForKey:@"events"];
//        NSLog(@"events = %@", events);
        for (NSDictionary *tempDic in events) {
            ActivityModel *model = [[ActivityModel alloc] init];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.activities addObject:model];
        }
        NSLog(@"activities = %@", weakSelf.activities);
    } failure:^(NSError *error) {
        NSLog(@"error = %@", error);
    }];

}

- (void)requestActivityDetailDataWith:(NSString *)ID
{
    ActivityDetailRequest *requet = [[ActivityDetailRequest alloc] init];
    [requet activityDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@"activity detail success = %@", dic);
    } failure:^(NSError *error) {
        NSLog(@"activity error = %@", error);
    }];
}

- (void)requestMovieData
{
    __weak typeof(self) weakSelf = self;
    MovieRequest *request = [[MovieRequest alloc] init];
    [request movieRequestWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"movie success = %@", dic);
//        NSString *movieTitle = [dic objectForKey:@"title"];
        NSArray *tempMovies = [dic objectForKey:@"entries"];
        for (NSDictionary *tempDic in tempMovies) {
            MovieModel *model = [[MovieModel alloc] init];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.movies addObject:model];
        }
        NSLog(@"weakSelf movies = %@", weakSelf.movies);
    } failure:^(NSError *error) {
        NSLog(@"movie error = %@", error);
    }];
}

- (void)requestMovieDetailWithID:(NSString *)ID
{
    MovieDetailRequest *request = [[MovieDetailRequest alloc] init];
    [request movieDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@"movie detail success = %@", dic);
    } failure:^(NSError *error) {
        NSLog(@"movie detail error = %@", error);
    }];
}

- (void)requestTheaterData
{
    TheaterRequest *request = [[TheaterRequest alloc] init];
    [request theaterRequestWithParameter:nil success:^(NSDictionary *dic) {
        NSLog(@"theater success = %@", dic);
    } failure:^(NSError *error) {
        NSLog(@"theater error = %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
