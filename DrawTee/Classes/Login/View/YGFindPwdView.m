//
//  YGFindPwdView.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/5/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGFindPwdView.h"

@implementation YGFindPwdView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"建立新賬號";
    titleLabel.font = [UIFont systemFontOfSize:20.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = colorWithRGBA(238, 87, 0, 1.0);
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(50);
        make.leading.equalTo(self.mas_leading).offset(30);
        make.trailing.equalTo(self.mas_trailing).offset(-30);
    }];
    
    UIView *emailView = [[UIView alloc] init];
    emailView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    emailView.layer.cornerRadius = 30;
    emailView.layer.masksToBounds = YES;
    [self addSubview:emailView];
    [emailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(20);
        make.leading.equalTo(self.mas_leading).offset(15);
        make.trailing.equalTo(self.mas_trailing).offset(-15);
        make.height.mas_equalTo(60);
    }];
    
    UIImageView *emailLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"email_reset"]];
    //    pwdLogo.backgroundColor = [UIColor randomColor];
    [emailView addSubview:emailLogo];
    [emailLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(emailView.mas_centerY);
        make.leading.equalTo(emailView.mas_leading).offset(20);
        make.width.and.height.mas_equalTo(40);
    }];
    
    UITextField *emailInput = [[UITextField alloc] init];
    //    pwdInput.backgroundColor = [UIColor randomColor];
    //    pwdInput.textAlignment = NSTextAlignmentCenter;
    emailInput.placeholder = @"請輸入郵箱地址";
    [emailView addSubview:emailInput];
    [emailInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.trailing.equalTo(emailView);
        make.leading.equalTo(emailLogo.mas_trailing).offset(10);
    }];
    
    UIButton *createBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    createBtn.backgroundColor = colorWithRGBA(237, 103, 30, 1.0);
    createBtn.layer.cornerRadius = 30;
    createBtn.layer.masksToBounds = YES;
    [createBtn setTitle:@"驗證" forState:UIControlStateNormal];
    createBtn.titleLabel.font = [UIFont systemFontOfSize:19.0];
    [createBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [createBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:createBtn];
    [createBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(emailView.mas_bottom).offset(5);
        make.height.leading.and.trailing.equalTo(emailView);
    }];
}

- (void)buttonClick
{
    NSLog(@"-----");
}

@end
