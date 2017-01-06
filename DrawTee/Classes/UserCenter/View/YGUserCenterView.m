//
//  YGUserCenterView.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/4/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGUserCenterView.h"
#import "YGVerticalButton.h"

@interface YGUserCenterView ()

@property (weak, nonatomic) UIImageView *iconImage;

@end

@implementation YGUserCenterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UIView *userView = [[UIView alloc] init];
    userView.layer.cornerRadius = 10;
    userView.layer.masksToBounds = YES;
    userView.backgroundColor = [UIColor whiteColor];
    [self addSubview:userView];
    [userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self);
        make.height.mas_equalTo(60);
    }];
    
    UIView *orderView = [[UIView alloc] init];
    orderView.layer.cornerRadius = 10;
    orderView.layer.masksToBounds = YES;
    orderView.backgroundColor = [UIColor whiteColor];
    [self addSubview:orderView];
    [orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.trailing.leading.equalTo(self);
        make.top.equalTo(userView.mas_bottom).offset(5);
    }];
    
    UIImageView *iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_icon"]];
    iconImage.userInteractionEnabled = YES;
    [iconImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapIcon:)]];
    [userView addSubview:iconImage];
    self.iconImage = iconImage;
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.mas_equalTo(50);
        make.centerY.equalTo(userView.mas_centerY);
        make.leading.equalTo(userView.mas_leading).offset(15);
    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"無名氏";
    nameLabel.font = [UIFont systemFontOfSize:16.0];
    nameLabel.textColor = colorWithRGBA(104, 104, 104, 1.0);
    [userView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(userView.mas_centerY);
        make.leading.equalTo(iconImage.mas_trailing).offset(10);
    }];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.tag = 0;
    [userView addSubview:addBtn];
    [addBtn addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(userView.mas_centerY);
        make.trailing.equalTo(userView.mas_trailing).offset(-20);
        make.height.and.width.mas_equalTo(25);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"我的訂單";
    titleLabel.font = [UIFont systemFontOfSize:17.0];
    [orderView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderView.mas_top).offset(15);
        make.leading.equalTo(orderView.mas_leading).offset(15);
    }];
    UIView *sepLine = [[UIView alloc] init];
    sepLine.backgroundColor = [UIColor lightGrayColor];
    [orderView addSubview:sepLine];
    [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(orderView.mas_trailing).offset(-15);
        make.leading.equalTo(orderView.mas_leading).offset(15);
        make.height.mas_equalTo(1);
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
    }];
    
    UIView *supView = [[UIView alloc] init];
//    supView.backgroundColor = [UIColor randomColor];
    [orderView addSubview:supView];
    [supView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.leading.trailing.equalTo(orderView);
        make.top.equalTo(sepLine.mas_bottom);
    }];
    
    YGVerticalButton *waitPay = [YGVerticalButton buttonWithType:UIButtonTypeCustom];
    waitPay.tag = 1;
    [waitPay setBadgeNumber:1];
    [waitPay setTitle:@"待付款" forState:UIControlStateNormal];
    waitPay.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [waitPay setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [waitPay setImage:[UIImage imageNamed:@"wait_pay"] forState:UIControlStateNormal];
    [waitPay addTarget:self action:@selector(buttonsClick:) forControlEvents:UIControlEventTouchUpInside];
    [supView addSubview:waitPay];
    [waitPay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo((kMainScreenW - 30) / 3);
        make.height.mas_equalTo(80);
        make.leading.top.bottom.equalTo(supView);
    }];
    
    YGVerticalButton *waitDelivery = [YGVerticalButton buttonWithType:UIButtonTypeCustom];
    waitDelivery.tag = 2;
    [waitDelivery setBadgeNumber:2];
    [waitDelivery setTitle:@"待發貨" forState:UIControlStateNormal];
    waitDelivery.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [waitDelivery setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [waitDelivery setImage:[UIImage imageNamed:@"delivery"] forState:UIControlStateNormal];
    [waitDelivery addTarget:self action:@selector(buttonsClick:) forControlEvents:UIControlEventTouchUpInside];
    [supView addSubview:waitDelivery];
    [waitDelivery mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(waitPay);
        make.centerY.equalTo(waitPay.mas_centerY);
        make.leading.equalTo(waitPay.mas_trailing);
    }];
    
    YGVerticalButton *waitTakeDelivery = [YGVerticalButton buttonWithType:UIButtonTypeCustom];
    waitTakeDelivery.tag = 3;
    [waitTakeDelivery setBadgeNumber:10];
    [waitTakeDelivery setTitle:@"待收貨" forState:UIControlStateNormal];
    waitTakeDelivery.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [waitTakeDelivery setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [waitTakeDelivery setImage:[UIImage imageNamed:@"car"] forState:UIControlStateNormal];
    [waitTakeDelivery addTarget:self action:@selector(buttonsClick:) forControlEvents:UIControlEventTouchUpInside];
    [supView addSubview:waitTakeDelivery];
    [waitTakeDelivery mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(waitPay);
        make.leading.equalTo(waitDelivery.mas_trailing);
        make.centerY.equalTo(waitPay.mas_centerY);
        make.trailing.equalTo(supView.mas_trailing);
    }];
}

- (void)tapIcon:(UIGestureRecognizer *)gesture
{
    NSLog(@"------");
    if (self.tapBlock) {
        self.tapBlock();
    }
    
}

- (void)addButtonClick
{
    NSLog(@"---");
}

- (void)buttonsClick:(UIButton *)clickBtn
{
//    NSLog(@"----");
    if ([self.delegate respondsToSelector:@selector(userCenterBtnsDidClick:)]) {
        [self.delegate userCenterBtnsDidClick:clickBtn];
    }
}

@end
