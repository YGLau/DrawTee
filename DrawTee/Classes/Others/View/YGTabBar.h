//
//  YGTabBar.h
//  DrawTee
//
//  Created by 刘勇刚 on 12/3/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YGTabBarDelegate <NSObject>

@optional
- (void)tabBarButtonDidClick:(UIButton *)selBtn;

@end

@interface YGTabBar : UIView


@property (weak, nonatomic) id<YGTabBarDelegate> delegate;

@end
