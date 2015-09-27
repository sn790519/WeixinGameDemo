//
//  GameListHeaderCell.m
//  TestWXGame
//
//  Created by hao on 8/27/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "GameListHeaderCell.h"

#import "Masonry.h"

@interface GameListHeaderCell ()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@end


@implementation GameListHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    _leftLabel = [UILabel new];
    _leftLabel.font = [UIFont systemFontOfSize:20];
    _leftLabel.textColor = [UIColor blackColor];
    _leftLabel.text = self.leftString;
    _leftLabel.text = @"新游";
    [self.contentView addSubview:_leftLabel];
    
    _rightLabel = [UILabel new];
    _rightLabel.font = [UIFont systemFontOfSize:14];
    _rightLabel.textColor = [UIColor brownColor];
    _rightLabel.text = self.rightString;
    _rightLabel.text = @"更多 >";
    [self.contentView addSubview:_rightLabel];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(@20);
    }];
    
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(@-20);
    }];
}

- (void)setLeftString:(NSString *)leftString
{
    self.leftLabel.text = leftString;
}

- (void)setRightString:(NSString *)rightString
{
    self.rightLabel.text = rightString;
}

@end





