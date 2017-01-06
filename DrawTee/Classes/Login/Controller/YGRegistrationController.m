//
//  YGRegistrationController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/5/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGRegistrationController.h"
#import "YGRegistrationView.h"

@interface YGRegistrationController ()

@end

@implementation YGRegistrationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"new account_bacground"]];
    [self.view addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.bottom.equalTo(self.view);
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(40);
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.height.and.width.mas_equalTo(40);
    }];
    
    
    YGRegistrationView *createDashBoard = [[YGRegistrationView alloc] init];
    createDashBoard.layer.cornerRadius = 15;
    createDashBoard.layer.masksToBounds = YES;
    createDashBoard.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:createDashBoard];
    [createDashBoard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(300);
        make.top.equalTo(self.view.mas_top).offset(kMainScreenW == 320 ? 140 : 200);
        make.height.mas_equalTo(300);
    }];
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_account"]];
    [self.view addSubview:logo];
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(createDashBoard.mas_top);
        make.height.and.width.mas_equalTo(80);
    }];
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
