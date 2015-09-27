//
//  GameListHeaderView.h
//  TestWXGame
//
//  Created by hao on 8/29/15.
//  Copyright (c) 2015 hao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GameListHeaderViewTapped <NSObject>

- (void)bannerTapped:(UIButton *)button;
- (void)gameClassTapped:(UIButton *)button;

@end

@interface GameListHeaderView : UIView

@property (nonatomic, weak) id<GameListHeaderViewTapped>delegate;

@end
