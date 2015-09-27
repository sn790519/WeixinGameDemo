//
//  HeaderView.m
//  TestWXGame
//
//  Created by hao on 8/18/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "ProfileCell.h"

#import "Masonry.h"

@interface ProfileCell ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *helloLabel;
@property (nonatomic, strong) UIButton *messageButton;
@property (nonatomic, strong) UIButton *activityButton;
@property (nonatomic, strong) UIView *tipsView;

@property (nonatomic, copy) NSString *tipsLabelString;

@end

@implementation ProfileCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    _avatarImageView = [UIImageView new];
    _avatarImageView.image = [UIImage imageNamed:@"avatar.png"];
    _avatarImageView.backgroundColor = [UIColor grayColor];
    _avatarImageView.layer.cornerRadius = 5;
    [self.contentView addSubview:_avatarImageView];
    
    _nameLabel = [UILabel new];
    _nameLabel.font = [UIFont systemFontOfSize:24];
    _nameLabel.text = @"我是谁?";
    [self.contentView addSubview:_nameLabel];
    
    _helloLabel = [UILabel new];
    _helloLabel.font = [UIFont systemFontOfSize:18];
    _helloLabel.text = @"nofree love jimxf love nofree";
    _helloLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_helloLabel];
    
    _messageButton = [UIButton new];
    _messageButton.layer.borderWidth = 0.2;
    _messageButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [_messageButton setImage:[UIImage imageNamed:@"msg.png"] forState:UIControlStateNormal];
    [_messageButton setTitle:@"我的消息" forState:UIControlStateNormal];
    [_messageButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_messageButton];
    
    _activityButton = [UIButton new];
    _activityButton.layer.borderWidth = 0.2;
    _activityButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [_activityButton setImage:[UIImage imageNamed:@"gift.png"] forState:UIControlStateNormal];
    [_activityButton setTitle:@"我的活动" forState:UIControlStateNormal];
    [_activityButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_activityButton];
    
    _tipsView = [UIView new];
    _tipsView.backgroundColor = [UIColor blackColor];
    _tipsView.layer.cornerRadius = 6;
    
    UIImageView *tipsIcon = [UIImageView new];
    tipsIcon.image = [UIImage imageNamed:@"gift.png"];
    [_tipsView addSubview:tipsIcon];
    [tipsIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.centerY.equalTo(_tipsView);
        make.left.equalTo(@3);
    }];
    
    _tipsLabelString = @"我是小气泡，敢点我？";
    UILabel *tipsLabel = [UILabel new];
    tipsLabel.textColor = [UIColor whiteColor];
    tipsLabel.font = [UIFont systemFontOfSize:16];
    tipsLabel.numberOfLines = 1;
    tipsLabel.text = _tipsLabelString;
    [_tipsView addSubview:tipsLabel];
    [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(tipsIcon.mas_right).offset(10);
        make.centerY.equalTo(_tipsView);
    }];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(98, 98));
        make.left.equalTo(@22);
        make.top.equalTo(@17);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatarImageView.mas_right).offset(15);
        make.top.equalTo(_avatarImageView.mas_top).offset(18);
    }];
    
    [_helloLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.bottom.equalTo(_avatarImageView.mas_bottom).offset(-18);
    }];
    
    [_messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.width.equalTo(_activityButton);
        make.left.equalTo(self.contentView);
        make.right.equalTo(_activityButton.mas_left);
        make.top.equalTo(_avatarImageView.mas_bottom).offset(17);
        
    }];
    
    [_activityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.width.equalTo(_messageButton);
        make.right.equalTo(self.contentView);
        make.left.equalTo(_messageButton.mas_right);
        make.top.equalTo(_messageButton);
    }];
    
    if (self.isLovely) {
        CGSize tipsLabelSize = [_tipsLabelString boundingRectWithSize:CGSizeMake(400, 40)
                                                              options:NSStringDrawingUsesLineFragmentOrigin
                                                           attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]}
                                                              context:nil].size;
        NSLog(@"_tipsLabelString width=%@", @(tipsLabelSize.width));
        [self.contentView addSubview:_tipsView];
        [_tipsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(tipsLabelSize.width + 45, 40));
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
        }];
    }
    else {
        [_tipsView removeFromSuperview];
    }

}

@end




