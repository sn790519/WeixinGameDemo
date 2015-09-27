//
//  GameListTableVC.m
//  TestWXGame
//
//  Created by hao on 8/27/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "GameListTableVC.h"
#import "WebViewController.h"
#import "GameListHeaderView.h"
#import "GameListGameCell.h"
#import "GameListHeaderCell.h"
#import "GameListBannerCell.h"

@interface GameListTableVC () <GameListHeaderViewTapped>

@end

@implementation GameListTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"精品游戏";
    
    [self.tableView registerClass:[GameListHeaderCell class] forCellReuseIdentifier:NSStringFromClass([GameListHeaderCell class])];
    [self.tableView registerClass:[GameListGameCell class] forCellReuseIdentifier:NSStringFromClass([GameListGameCell class])];
    [self.tableView registerClass:[GameListBannerCell class] forCellReuseIdentifier:NSStringFromClass([GameListBannerCell class])];
    
    if (!self.tableView.tableHeaderView) {
        CGRect frame = self.view.frame;
        GameListHeaderView *headerView = [[GameListHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), 300)];
        headerView.delegate = self;
        self.tableView.tableHeaderView = headerView;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }
    else if (section == 1) {
        return 20;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 40;
    }
    else if (indexPath.row == 4 || indexPath.row == 9) {
        return 120;
    }
    return 90;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        GameListHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GameListHeaderCell class])];
        cell.leftString = (indexPath.section == 0) ? @"新游" : @"精品游戏";
        cell.rightString = (indexPath.section == 0) ? @"更多 >" : @"我还不会排序";
        
        return cell;
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 4 || indexPath.row == 9) {
            GameListBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GameListBannerCell class])];
            return cell;
        }
    }
    GameListGameCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GameListGameCell class])];
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"GameList2WebView"]) {
        WebViewController *controller = (WebViewController *)segue.destinationViewController;
        controller.url = [NSURL URLWithString:sender];
    }
}

#pragma mark - GameListHeaderViewTapped

- (void)bannerTapped:(UIButton *)button
{
    [self performSegueWithIdentifier:@"GameList2WebView" sender:@"http://www.douban.com"];
}

- (void)gameClassTapped:(UIButton *)button
{
    [self performSegueWithIdentifier:@"GameList2WebView" sender:@"http://www.zhihu.com"];
}

@end
