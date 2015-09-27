//
//  GameListGameCell.m
//  TestWXGame
//
//  Created by hao on 8/27/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "GameListGameCell.h"
#import "Masonry.h"

@interface GameListGameCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIButton *button;

@end

@implementation GameListGameCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    _iconImageView = [UIImageView new];
    _iconImageView.backgroundColor = [UIColor grayColor];
    _iconImageView.image = [UIImage imageNamed:@"game_icon.png"];
    [self.contentView addSubview:_iconImageView];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.text = @"热血传奇";
    [self.contentView addSubview:_titleLabel];
    
    _descLabel = [UILabel new];
    _descLabel.font = [UIFont systemFontOfSize:15];
    _descLabel.textColor = [UIColor lightGrayColor];
    _descLabel.numberOfLines = 2;
    _descLabel.text = @"角色 | 360M\n官方正版传奇手游";
    [self.contentView addSubview:_descLabel];
    
    _button = [UIButton new];
    _button.layer.cornerRadius = 3;
    _button.layer.borderWidth = 0.4;
    _button.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [_button setTitle:@"下载" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_button];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.equalTo(@22);
        make.top.equalTo(@15);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).offset(12);
        make.top.mas_equalTo(_iconImageView.mas_top).offset(2);
    }];
    
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.bottom.equalTo(_iconImageView);
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.centerY.equalTo(_iconImageView);
        make.right.equalTo(@-22.5);
    }];
}

@end
