//
//  GameListHeaderView.m
//  TestWXGame
//
//  Created by hao on 8/29/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import "GameListHeaderView.h"
#import "WebViewController.h"
#import "Masonry.h"

@interface GameListHeaderView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *classButton1;
@property (nonatomic, strong) UIButton *classButton2;
@property (nonatomic, strong) UIButton *classButton3;
@property (nonatomic, strong) UIButton *classButton4;
@property (nonatomic, strong) UIButton *classButton5;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UILabel *label4;
@property (nonatomic, strong) UILabel *label5;

@end

@implementation GameListHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    CGFloat width = CGRectGetWidth(frame);
    CGFloat height = 200;
    
    _scrollView = [UIScrollView new];
    _scrollView.frame = frame;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollEnabled = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.contentSize = CGSizeMake(width * 3, height);
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    
    for (NSUInteger i = 0; i < 3; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(width * i, 0, width, height)];
        [button setImage:[UIImage imageNamed:@"zolo-slide.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(bannerTapped:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:button];
    }
    
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = 3;
    _pageControl.currentPage = 0;
    [self addSubview:_pageControl];
    
    _classButton1 = [UIButton new];
    _classButton1.layer.cornerRadius = 4;
    [_classButton1 setImage:[UIImage imageNamed:@"cls0.png"] forState:UIControlStateNormal];
    [_classButton1 addTarget:self action:@selector(gameClassTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_classButton1];
    
    _classButton2 = [UIButton new];
    _classButton2.layer.cornerRadius = 4;
    [_classButton2 setImage:[UIImage imageNamed:@"cls1.png"] forState:UIControlStateNormal];
    [_classButton2 addTarget:self action:@selector(gameClassTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_classButton2];
    
    _classButton3 = [UIButton new];
    _classButton3.layer.cornerRadius = 4;
    [_classButton3 setImage:[UIImage imageNamed:@"cls2.png"] forState:UIControlStateNormal];
    [_classButton3 addTarget:self action:@selector(gameClassTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_classButton3];
    
    _classButton4 = [UIButton new];
    _classButton4.layer.cornerRadius = 4;
    [_classButton4 setImage:[UIImage imageNamed:@"cls3.png"] forState:UIControlStateNormal];
    [_classButton4 addTarget:self action:@selector(gameClassTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_classButton4];
    
    _classButton5 = [UIButton new];
    _classButton5.layer.cornerRadius = 4;
    [_classButton5 setImage:[UIImage imageNamed:@"cls4.png"] forState:UIControlStateNormal];
    [_classButton5 addTarget:self action:@selector(gameClassTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_classButton5];
    
    _label1 = [UILabel new];
    _label1.font = [UIFont systemFontOfSize:16];
    _label1.text = @"角色";
    [self addSubview:_label1];
    
    _label2 = [UILabel new];
    _label2.font = [UIFont systemFontOfSize:16];
    _label2.text = @"动作";
    [self addSubview:_label2];
    
    _label3 = [UILabel new];
    _label3.font = [UIFont systemFontOfSize:16];
    _label3.text = @"策略";
    [self addSubview:_label3];
    
    _label4 = [UILabel new];
    _label4.font = [UIFont systemFontOfSize:16];
    _label4.text = @"休闲";
    [self addSubview:_label4];
    
    _label5 = [UILabel new];
    _label5.font = [UIFont systemFontOfSize:16];
    _label5.text = @"棋牌";
    [self addSubview:_label5];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(CGRectGetWidth(self.frame), 200));
        make.left.equalTo(self);
        make.top.equalTo(self);
    }];
    
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_scrollView);
        make.bottom.equalTo(_scrollView.mas_bottom).offset(-10);
    }];
    
    CGFloat offset = (CGRectGetWidth(self.frame) - 60 * 5) / 5;
    CGSize size = CGSizeMake(60, 60);
    
    [_classButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.left.equalTo(@(offset / 2));
        make.top.equalTo(_scrollView.mas_bottom).offset(10);
    }];
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_classButton1);
        make.top.equalTo(_classButton1.mas_bottom).offset(5);
    }];
    
    [_classButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.left.equalTo(_classButton1.mas_right).offset(offset);
        make.top.equalTo(_classButton1);
    }];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_classButton2);
        make.centerY.equalTo(_label1);
    }];
    
    [_classButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.left.equalTo(_classButton2.mas_right).offset(offset);
        make.top.equalTo(_classButton1);
    }];
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_classButton3);
        make.centerY.equalTo(_label1);
    }];
    
    [_classButton4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.left.equalTo(_classButton3.mas_right).offset(offset);
        make.top.equalTo(_classButton1);
    }];
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_classButton4);
        make.centerY.equalTo(_label1);
    }];
    
    [_classButton5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.left.equalTo(_classButton4.mas_right).offset(offset);
        make.top.equalTo(_classButton1);
    }];
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_classButton5);
        make.centerY.equalTo(_label1);
    }];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSUInteger page = scrollView.contentOffset.x / CGRectGetWidth(self.frame);
    _pageControl.currentPage = page;
}

#pragma mark - IBAction

- (void)bannerTapped:(UIButton *)button
{
    [self.delegate bannerTapped:button];
}

- (void)gameClassTapped:(UIButton *)button
{
    [self.delegate gameClassTapped:button];
}

@end




