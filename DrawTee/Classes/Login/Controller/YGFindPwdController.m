//
//  YGFindPwdController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/5/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGFindPwdController.h"
#import "YGFindPwdView.h"

@interface YGFindPwdController ()

@end

@implementation YGFindPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"reset_background"]];
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
    
    YGFindPwdView *findPwdDashBoard = [[YGFindPwdView alloc] init];
    findPwdDashBoard.layer.cornerRadius = 15;
    findPwdDashBoard.layer.masksToBounds = YES;
    findPwdDashBoard.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:findPwdDashBoard];
    [findPwdDashBoard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(300);
        make.top.equalTo(self.view.mas_top).offset(kMainScreenW == 320 ? 140 : 200);
        make.height.mas_equalTo(250);
    }];
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pass_reset"]];
    [self.view addSubview:logo];
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(findPwdDashBoard.mas_top);
        make.height.and.width.mas_equalTo(80);
    }];
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
