//
//  HotPlayCell.m
//  TestWXGame
//
//  Created by hao on 8/18/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "HotPlayCell.h"
#import "Masonry.h"

@interface HotPlayCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIImageView *iconImageView1;
@property (nonatomic, strong) UILabel *descLabel1;
@property (nonatomic, strong) UIImageView *iconImageView2;
@property (nonatomic, strong) UILabel *descLabel2;
@property (nonatomic, strong) UIImageView *iconImageView3;
@property (nonatomic, strong) UILabel *descLabel3;



@end

@implementation HotPlayCell

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
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.text = @"神一般的传奇";
    [self.contentView addSubview:_titleLabel];
    
    _descLabel = [UILabel new];
    _descLabel.font = [UIFont systemFontOfSize:18];
    _descLabel.textColor = [UIColor grayColor];
    _descLabel.text = @"最受期待的移植游戏";
    [self.contentView addSubview:_descLabel];
    
    _button = [UIButton new];
    _button.layer.cornerRadius = 3;
    _button.layer.borderWidth = 0.4;
    _button.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [_button setTitle:@"下载" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_button];
    
    _lineView = [UIView new];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_lineView];
    
    _iconImageView1 = [UIImageView new];
    _iconImageView1.image = [UIImage imageNamed:@"game_desc_icon.png"];
    _iconImageView1.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_iconImageView1];
    
    _descLabel1 = [UILabel new];
    _descLabel1.font = [UIFont systemFontOfSize:13];
    _descLabel1.textColor = [UIColor grayColor];
    _descLabel1.text = @"超过7亿人下载";
    [self.contentView addSubview:_descLabel1];
    
    _iconImageView2 = [UIImageView new];
    _iconImageView2.image = [UIImage imageNamed:@"game_desc_icon.png"];
    _iconImageView2.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_iconImageView2];
    
    _descLabel2 = [UILabel new];
    _descLabel2.font = [UIFont systemFontOfSize:13];
    _descLabel2.textColor = [UIColor grayColor];
    _descLabel2.text = @"超过7亿人点赞";
    [self.contentView addSubview:_descLabel2];
    
    _iconImageView3 = [UIImageView new];
    _iconImageView3.image = [UIImage imageNamed:@"game_desc_icon.png"];
    _iconImageView3.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_iconImageView3];
    
    _descLabel3 = [UILabel new];
    _descLabel3.font = [UIFont systemFontOfSize:13];
    _descLabel3.textColor = [UIColor grayColor];
    _descLabel3.text = @"不止10人玩爆了";
    [self.contentView addSubview:_descLabel3];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.equalTo(@15);
        make.top.equalTo(@20);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).offset(12);
        make.top.mas_equalTo(_iconImageView.mas_top).offset(2);
    }];
    
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.bottom.equalTo(_iconImageView.mas_bottom).offset(-5);
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.centerY.equalTo(_iconImageView);
        make.right.equalTo(@-22.5);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.contentView.bounds.size.width - 40, 0.2));
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(_iconImageView.mas_bottom).offset(15);
    }];
    
    CGSize size = CGSizeMake(60, 60);
    [_iconImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.left.equalTo(@50);
        make.top.equalTo(_lineView.mas_bottom).offset(20);
    }];
    [_descLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_iconImageView1);
        make.top.equalTo(_iconImageView1.mas_bottom).offset(10);
    }];
    
    [_iconImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(_iconImageView1);
    }];
    [_descLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_iconImageView2);
        make.top.equalTo(_iconImageView2.mas_bottom).offset(10);
    }];
    
    [_iconImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.right.equalTo(@-50);
        make.top.equalTo(_iconImageView1);
    }];
    [_descLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_iconImageView3);
        make.top.equalTo(_iconImageView3.mas_bottom).offset(10);
    }];
}

@end




