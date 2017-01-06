//
//  YGLoginDashBoard.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/5/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGLoginDashBoard.h"

@implementation YGLoginDashBoard

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
    UIView *username = [[UIView alloc] init];
    username.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    
    username.layer.cornerRadius = kMainScreenW == 320 ? 25 : 30;
    username.layer.masksToBounds = YES;
    [self addSubview:username];
    [username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self);
        make.height.mas_equalTo(kMainScreenW == 320 ? 50 : 60);
    }];
    
    UIImageView *userLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_icon"]];
//    userLogo.backgroundColor = [UIColor randomColor];
    [username addSubview:userLogo];
    [userLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(username.mas_centerY);
        make.leading.equalTo(username.mas_leading).offset(20);
        make.width.and.height.mas_equalTo(40);
    }];
    
    UITextField *nameInput = [[UITextField alloc] init];
//    nameInput.backgroundColor = [UIColor randomColor];
    nameInput.placeholder = @"請輸入用戶名";
//    nameInput.textAlignment = NSTextAlignmentCenter;
    [username addSubview:nameInput];
    [nameInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.trailing.equalTo(username);
        make.leading.equalTo(userLogo.mas_trailing).offset(10);
    }];
    
    
    UIView *pwd = [[UIView alloc] init];
    pwd.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    pwd.layer.cornerRadius = username.layer.cornerRadius;
    pwd.layer.masksToBounds = YES;
    [self addSubview:pwd];
    [pwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(username.mas_bottom).offset(10);
        make.leading.trailing.height.equalTo(username);
        
    }];
    
    UIImageView *pwdLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password_icon"]];
//    pwdLogo.backgroundColor = [UIColor randomColor];
    [pwd addSubview:pwdLogo];
    [pwdLogo mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.equalTo(pwd);
        make.centerY.equalTo(pwd.mas_centerY);
        make.leading.equalTo(pwd.mas_leading).offset(20);
        make.width.and.height.equalTo(userLogo);
    }];
    
    UITextField *pwdInput = [[UITextField alloc] init];
//    pwdInput.backgroundColor = [UIColor randomColor];
//    pwdInput.textAlignment = NSTextAlignmentCenter;
    pwdInput.placeholder = @"請輸入密碼";
    [pwd addSubview:pwdInput];
    [pwdInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.trailing.equalTo(pwd);
        make.leading.equalTo(pwdLogo.mas_trailing).offset(10);
    }];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.tag = 1;
    [loginBtn setTitle:@"登入" forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = username.layer.cornerRadius;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.backgroundColor = colorWithRGBA(249, 169, 6, 1.0);
    [loginBtn addTarget:self action:@selector(forgetAndRegisterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwd.mas_bottom).offset(10);
        make.leading.trailing.height.equalTo(username);
    }];
    
    UIButton *forgotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgotBtn.tag = 2;
//    forgotBtn.backgroundColor = [UIColor randomColor];
    [forgotBtn setTitle:@"忘記密碼？" forState:UIControlStateNormal];
    [forgotBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [forgotBtn addTarget:self action:@selector(forgetAndRegisterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:forgotBtn];
    [forgotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom);
        make.leading.bottom.equalTo(self);
//        make.width.equalTo(self.mas_width);
        
    }];
    
    UIButton *createBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    createBtn.tag = 3;
//    createBtn.backgroundColor = [UIColor randomColor];
    [createBtn setTitle:@"建立新賬戶" forState:UIControlStateNormal];
    [createBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [createBtn addTarget:self action:@selector(forgetAndRegisterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:createBtn];
    [createBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self);
        make.leading.equalTo(forgotBtn.mas_trailing);
        make.top.bottom.width.height.equalTo(forgotBtn);
    }];
    
    UIView *midleLine = [[UIView alloc] init];
    midleLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:midleLine];
    [midleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(15);
    }];
}

- (void)forgetAndRegisterButtonClick:(UIButton *)button
{
    NSLog(@" tag --- > %zd", button.tag);
    if ([self.delegate respondsToSelector:@selector(dashBoardBtnDidClick:)]) {
        [self.delegate dashBoardBtnDidClick:button];
    }
}

@end

