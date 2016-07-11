//
//  RootTableViewController.m
//  轮播图---手表
//
//  Created by lanou3g on 16/6/21.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "RootTableViewController.h"
#import "MyTableViewCell.h"
#import "Scrollview.h"
#import "Model.h"
#define kWith self.view.frame.size.width
#define kHeight self.view.frame.size.height
@interface RootTableViewController ()

@property(nonatomic,strong)Scrollview *scroll;
@property(nonatomic,strong)UIPageControl *page;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.tableView registerClass:[MyTableViewCell class]forCellReuseIdentifier:@"cell"];
    
    
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self addmake];
    [self makedata];
}
-(void)addmake{
    self.scroll = [[Scrollview alloc]initWithFrame:CGRectMake(0, 0,kWith, kHeight*0.3)];
    
    self.tableView.tableHeaderView = self.scroll;
    
    self.page = [[UIPageControl alloc]initWithFrame:CGRectMake(50, kHeight-40, kWith-100, 40)];
    
    self.page.numberOfPages = 5;
    
    [self.tableView addSubview:self.page];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerpage) userInfo:nil repeats:YES];
    
}
-(void)timerpage{
    if (self.page.currentPage == 4) {
        self.page.currentPage = 0;
    }else{
        self.page.currentPage++;
        
    }
    self.scroll.contentOffset = CGPointMake(kWith*self.page.currentPage, 0);
}
-(void)makedata{
    self.dataArray = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"GoodsList" ofType:@"plist"];
    NSArray *arraydata = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dic in arraydata) {
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:dic[@"name"]];
        NSMutableArray *aa = [NSMutableArray array];
        for (NSDictionary *dic2 in dic[@"kind"]) {
            Model *mode = [[Model alloc]init];
            [mode setValuesForKeysWithDictionary:dic2];
            [aa addObject:mode];
        }
        [self.dataArray addObject:aa];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [self.dataArray[section]count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Model *mode = self.dataArray[indexPath.section][indexPath.row];
    cell.namelabel.text = mode.title;
    cell.rmlabel.text = mode.description;
    cell.imageV.image =[UIImage imageNamed:mode.image_name];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
