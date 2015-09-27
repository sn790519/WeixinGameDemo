//
//  GameListBannerCell.m
//  TestWXGame
//
//  Created by hao on 8/29/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "GameListBannerCell.h"
#import "Masonry.h"

@interface GameListBannerCell ()

@property (nonatomic, strong) UIButton *bannerButton;

@end

@implementation GameListBannerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    _bannerButton = [UIButton new];
    _bannerButton.layer.masksToBounds = YES;
    [_bannerButton setImage:[UIImage imageNamed:@"banner.png"] forState:UIControlStateNormal];
    [self.contentView addSubview:_bannerButton];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_bannerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(320, CGRectGetWidth(self.frame)));
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
    }];
}

@end
