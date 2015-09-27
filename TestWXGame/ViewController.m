//
//  ViewController.m
//  TestWXGame
//
//  Created by hao on 8/18/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import "GameListTableVC.h"

#import "ProfileCell.h"
#import "HotPlayCell.h"
#import "RecentGamesCell.h"
#import "HitGamesCell.h"

#import "UIColor+HexRGB.h"

#import "Masonry.h"


@interface ViewController ()

@property (nonatomic, assign) BOOL isLovely;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self.tableView registerClass:[ProfileCell class] forCellReuseIdentifier:NSStringFromClass([ProfileCell class])];
    [self.tableView registerClass:[HotPlayCell class] forCellReuseIdentifier:NSStringFromClass([HotPlayCell class])];
    [self.tableView registerClass:[RecentGamesCell class] forCellReuseIdentifier:NSStringFromClass([RecentGamesCell class])];
    [self.tableView registerClass:[HitGamesCell class] forCellReuseIdentifier:NSStringFromClass([HitGamesCell class])];
    
    self.tableView.backgroundColor = [UIColor colorFromHex:0xf1f0f6];
    
    _isLovely = YES;
    _isLovely = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
        return 11;
    }
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect frame = self.view.frame;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    view.backgroundColor = [UIColor colorFromHex:0xf1f0f6];
    
    UILabel *label = [UILabel new];
    label.textColor = [UIColor colorFromHex:0xa3a3a4];
    label.frame = CGRectMake(30, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
    
    if (section == 1) {
        label.text = @"最近在玩";
    }
    else if (section == 2) {
        label.text = @"好友热玩";
    }
    else if (section == 3) {
        label.text = @"畅销游戏";
    }
    
    [view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view);
        make.left.equalTo(@23);
    }];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"BasicCell";
    
    if (indexPath.section == 0) {
        ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ProfileCell class])];
        cell.isLovely = _isLovely;
        
        return  cell;
    }
    else if (indexPath.section == 1) {
        identifier = NSStringFromClass([RecentGamesCell class]);
    }
    else if (indexPath.section == 2) {
        identifier = NSStringFromClass([HotPlayCell class]);
    }
    else if (indexPath.section == 3) {
        if (indexPath.row == 10) {
            return [self getHitGameCellFooterView];
        }
        
        HitGamesCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HitGamesCell class]) forIndexPath:indexPath];
        [cell setOrder:(indexPath.row + 1)];
        cell.isNew = (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 9);
        
        return cell;
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return _isLovely ? 230 : 172;;
    }
    else if (indexPath.section == 1) {
        return 124;
    }
    else if (indexPath.section == 2) {
        return 216;
    }
    else if (indexPath.section == 3) {
        if (indexPath.row <= 2) {
            return 160;
        }
        else if (indexPath.row <= 9) {
            return 100;
        }
        return 40;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self performSegueWithIdentifier:@"Index2WebView" sender:[NSURL URLWithString:@"http://www.qq.com"]];
    }
    else if (indexPath.section == 3 && indexPath.row == 10) {
        [self performSegueWithIdentifier:@"Index2GameList" sender:nil];
    }

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// Get the new view controller using [segue destinationViewController].
// Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Index2WebView"]) {
        WebViewController *controller = (WebViewController *)segue.destinationViewController;
        controller.url = (NSURL *)sender;
    }
//    else if ([segue.identifier isEqualToString:@"Index2GameList"]) {
//        GameListTableVC *controller = (GameListTableVC *)segue.destinationViewController;
//    }
}

#pragma mark - Private

- (UITableViewCell *)getHitGameCellFooterView
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HitGameFooter"];
    cell.frame = self.view.frame;
    
    UILabel *label = [UILabel new];
    label.textColor = [UIColor blueColor];
    label.text = @"更多精品游戏 >";
    
    [cell.contentView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(cell.contentView);
        make.centerY.equalTo(cell.contentView);
    }];
    
    return cell;
}

- (IBAction)refreshTips:(id)sender {
    _isLovely = !_isLovely;
    
    [self.tableView reloadData];
}

@end




