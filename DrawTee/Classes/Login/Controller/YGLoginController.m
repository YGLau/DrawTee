//
//  YGLoginController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/5/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGLoginController.h"
#import "YGLoginDashBoard.h"
#import "YGOtherLoginView.h"
#import "YGRegistrationController.h"
#import "YGFindPwdController.h"

@interface YGLoginController ()<loginDashBoardDelegate>

@end

@implementation YGLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_background"]];
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

    
    YGLoginDashBoard *dashBoard = [[YGLoginDashBoard alloc] init];
    dashBoard.delegate = self;
    [self.view addSubview:dashBoard];
//    dashBoard.backgroundColor = [UIColor randomColor];
    [dashBoard mas_makeConstraints:^(MASConstraintMaker *make) {
        if (kMainScreenW == 320) {
            make.top.equalTo(self.view.mas_top).offset(180);
        } else if (kMainScreenW == 375 || kMainScreenW == 414) {
            make.top.equalTo(self.view.mas_top).offset(250);
        } else {
            make.top.equalTo(self.view.mas_top).offset(350);
        }
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(300);
//        make.height.mas_equalTo(kMainScreenW == 320 ? 220 : 260);
    }];
    
    YGOtherLoginView *otherLogin = [[YGOtherLoginView alloc] init];
    [self.view addSubview:otherLogin];
//    otherLogin.backgroundColor = [UIColor randomColor];
    [otherLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dashBoard.mas_bottom).offset(kMainScreenW == 320 ? 10 : 20);
        make.leading.trailing.equalTo(dashBoard);
//        make.height.mas_equalTo(kMainScreenW == 320 ? 120 :160);
    }];
    
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - loginDashBoardDelegate
- (void)dashBoardBtnDidClick:(UIButton *)button
{
    if (button.tag == 1) { // login
        
    } else if (button.tag == 2) { // forgot
        YGFindPwdController *findPwdVc = [[YGFindPwdController alloc] init];
        [self presentViewController:findPwdVc animated:YES completion:nil];
    } else { // create
        YGRegistrationController *registrationVc = [[YGRegistrationController alloc] init];
        [self presentViewController:registrationVc animated:YES completion:nil];
    }
}


@end
