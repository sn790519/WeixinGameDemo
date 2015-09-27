//
//  HitGamesCell.m
//  TestWXGame
//
//  Created by hao on 8/18/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "HitGamesCell.h"
#import "UIColor+HexRGB.h"
#import "Masonry.h"

@interface HitGamesCell ()

@property (nonatomic, strong) UILabel *orderLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIView *blankView;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *fNewLabel;

@end

@implementation HitGamesCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    _orderLabel = [UILabel new];
    _orderLabel.font = [UIFont systemFontOfSize:22];
    _orderLabel.textColor = [UIColor colorFromHex:0x888888];
    _orderLabel.text = @"1";
    [self.contentView addSubview:_orderLabel];
    
    _iconImageView = [UIImageView new];
    _iconImageView.image = [UIImage imageNamed:@"game_icon.png"];
    [self.contentView addSubview:_iconImageView];
    
    _nameLabel = [UILabel new];
    _nameLabel.font = [UIFont systemFontOfSize:20];
    _nameLabel.text = @"热血传奇";
    [self.contentView addSubview:_nameLabel];
    
    _fNewLabel = [UILabel new];
    _fNewLabel.layer.masksToBounds = YES;
    _fNewLabel.layer.cornerRadius = 7;
    _fNewLabel.font = [UIFont systemFontOfSize:16];
    _fNewLabel.textColor = [UIColor whiteColor];
    _fNewLabel.backgroundColor = [UIColor redColor];
    _fNewLabel.text = @"new";
//    [self.contentView addSubview:_fNewLabel];
    
    _subtitleLabel = [UILabel new];
    _subtitleLabel.font = [UIFont systemFontOfSize:18];
    _subtitleLabel.textColor = [UIColor grayColor];
    _subtitleLabel.text = @"官方正版传奇手游";
    [self.contentView addSubview:_subtitleLabel];
    
    _button = [UIButton new];
    _button.layer.cornerRadius = 3;
    _button.layer.borderWidth = 0.4;
    _button.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [_button setTitle:@"下载" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_button];
    
    _blankView = [UIView new];
    _blankView.backgroundColor = [UIColor colorFromHex:0xf0eff5];
//    [self.contentView addSubview:_blankView];
    
    _descLabel = [UILabel new];
    _descLabel.font = [UIFont systemFontOfSize:18];
    _descLabel.textColor = [UIColor grayColor];
    _descLabel.numberOfLines = 2;
    _descLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _descLabel.text = @"最近超过6百万人在玩\n2百万人刚加入这款游戏";
//    [self.contentView addSubview:_descLabel];
    
    _isNew = NO;
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_left).offset(20);
        make.top.equalTo(@20);
    }];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.equalTo(@40);
        make.top.equalTo(@20);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).offset(12);
        make.top.equalTo(_iconImageView.mas_top).offset(2);
    }];
    
    if (self.isNew) {
        [self.contentView addSubview:_fNewLabel];
        [_fNewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nameLabel.mas_right).offset(6);
            make.centerY.equalTo(_nameLabel);
        }];
    }
    else {
        [_fNewLabel removeFromSuperview];
    }
    
    [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.bottom.equalTo(_iconImageView.mas_bottom).offset(-5);
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.centerY.equalTo(_iconImageView);
        make.right.equalTo(@-22.5);
    }];
    
    if (self.order <= 3) {
        [self.contentView addSubview:_blankView];
        [_blankView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(3, 44));
            make.left.equalTo(_iconImageView);
            make.top.equalTo(_iconImageView.mas_bottom).offset(19);
        }];
        
        [self.contentView addSubview:_descLabel];
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_blankView.mas_right).offset(16);
            make.top.equalTo(_iconImageView.mas_bottom).offset(19);
        }];
    }
    else {
        [_blankView removeFromSuperview];
        [_descLabel removeFromSuperview];
    }
}

- (void)setOrder:(NSUInteger)order
{
    _order = order;
    _orderLabel.text = [NSString stringWithFormat:@"%@", @(order)];
}

@end






