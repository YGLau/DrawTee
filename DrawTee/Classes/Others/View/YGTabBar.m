//
//  YGTabBar.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/3/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGTabBar.h"

@interface YGTabBar ()

@property (weak, nonatomic) UIButton *selectedBtn;

@property (weak, nonatomic) UIButton *homeBtn;

@end

@implementation YGTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupChildWidgets];
        // default to select one button
        [self buttondidClick:self.homeBtn];
    }
    return self;
}

- (void)setupChildWidgets
{
    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    homeBtn.tag = 1;
    [homeBtn setImage:[UIImage imageNamed:@"icon_home_off"] forState:UIControlStateNormal];
    [homeBtn setImage:[UIImage imageNamed:@"icon_home_on"] forState:UIControlStateDisabled];
    [homeBtn addTarget:self action:@selector(buttondidClick:) forControlEvents:UIControlEventTouchUpInside];
//    homeBtn.backgroundColor = [UIColor randomColor];
    [self addSubview:homeBtn];
    self.homeBtn = homeBtn;
    [homeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.top.equalTo(self);
        make.height.and.width.mas_equalTo(50);
    }];
    
    UIButton *shopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shopBtn.tag = 2;
    [shopBtn setImage:[UIImage imageNamed:@"icon_shopping cart_off"] forState:UIControlStateNormal];
    [shopBtn setImage:[UIImage imageNamed:@"icon_shopping cart_on"] forState:UIControlStateDisabled];
    [shopBtn addTarget:self action:@selector(buttondidClick:) forControlEvents:UIControlEventTouchUpInside];
//    shopBtn.backgroundColor = [UIColor randomColor];
    [self addSubview:shopBtn];
    [shopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.and.width.equalTo(homeBtn);
    }];
    
    UIButton *profileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    profileBtn.tag = 3;
    [profileBtn setImage:[UIImage imageNamed:@"icon_user_off"] forState:UIControlStateNormal];
    [profileBtn setImage:[UIImage imageNamed:@"icon_user_on"] forState:UIControlStateDisabled];
    [profileBtn addTarget:self action:@selector(buttondidClick:) forControlEvents:UIControlEventTouchUpInside];
//    profileBtn.backgroundColor = [UIColor randomColor];
    [self addSubview:profileBtn];
    [profileBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(homeBtn);
        make.trailing.and.top.equalTo(self);
    }];
}

- (void)buttondidClick:(UIButton *)selBtn
{
    self.selectedBtn.enabled = YES;
    selBtn.enabled = NO;
    self.selectedBtn = selBtn;
    // call delegate
    if ([self.delegate respondsToSelector:@selector(tabBarButtonDidClick:)]) {
        [self.delegate tabBarButtonDidClick:self.selectedBtn];
    }
    
}

@end
