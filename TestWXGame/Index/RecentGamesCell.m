//
//  RecentGamesCell.m
//  TestWXGame
//
//  Created by hao on 8/18/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "RecentGamesCell.h"
#import "Masonry.h"

@interface RecentGamesCell ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *games;

@end

@implementation RecentGamesCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    _scrollView = [UIScrollView new];
    _scrollView.userInteractionEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollEnabled = YES;
    _scrollView.alwaysBounceHorizontal = YES;
    [self.contentView addSubview:_scrollView];
    
    _games = @[@"打飞机", @"天天做需求", @"全民吃饭", @"全民开挂", @"Vianglory"];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = CGSizeMake(60, 60);
    CGFloat offset = 30;
    
    __block UIImageView *preView = [UIImageView new];
    preView.backgroundColor = [UIColor greenColor];
    preView.image = [UIImage imageNamed:@"game_icon.png"];
    [_scrollView addSubview:preView];
    [preView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.left.mas_equalTo(offset);
        make.top.equalTo(@18);
    }];
    
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = _games[0];
    [_scrollView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(preView);
        make.top.equalTo(preView.mas_bottom).offset(16);
    }];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat scrollViewWidth = 60 + offset;
        for (NSUInteger i = 1; i < _games.count; i++) {
            UIImageView *imageView = [UIImageView new];
            imageView.backgroundColor = [UIColor greenColor];
            imageView.image = [UIImage imageNamed:@"game_icon.png"];
            UILabel *gameNameLabel = [UILabel new];
            gameNameLabel.text = _games[i];
            [_scrollView addSubview:imageView];
            [_scrollView addSubview:gameNameLabel];
            
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(size);
                make.left.equalTo(preView.mas_right).offset(offset+8);
                make.top.equalTo(preView);
            }];
            [gameNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(imageView);
                make.top.equalTo(imageView.mas_bottom).offset(16);
            }];
            
            preView = imageView;
            scrollViewWidth += 60 + offset;
        }
        scrollViewWidth += offset;
        NSLog(@"scrollViewWidth=%@", @(scrollViewWidth));
        NSLog(@"self.contentView.bounds.size.width=%@", @(self.contentView.bounds.size.width));
        if (scrollViewWidth < self.contentView.bounds.size.width) {
            scrollViewWidth = self.contentView.bounds.size.width;
        }
//        _scrollView.contentSize = CGSizeMake(scrollViewWidth, 124);
        make.size.mas_equalTo(CGSizeMake(scrollViewWidth, 124));
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(@0);
    }];
}


@end
