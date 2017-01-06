//
//  YGHeadView.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/4/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGHeadView.h"

@interface YGHeadView ()


@property (weak, nonatomic) UILabel *titleLabel;

@end

@implementation YGHeadView

- (instancetype)initSubViewsWithTitle:(NSString *)title leftBarbButtonImageName:(NSString *)leftImageName rightImageName:(NSString *)rightImageName
{
    if (self = [super initWithFrame:CGRectZero]) {
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:17.0];
        titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        // @"setting"
        UIButton *settingsBtn = [self createButtonWithImage:leftImageName];
        settingsBtn.tag = 1;
        [settingsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.leading.equalTo(self.mas_leading);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(21);
        }];
        // @"message"
        UIButton *chatBtn = [self createButtonWithImage:rightImageName];
        chatBtn.tag = 2;
        [chatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.trailing.equalTo(self.mas_trailing);
            make.height.and.width.mas_equalTo(24);
        }];
    }
    return self;
}

- (void)setViewTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (nullable UIButton *)createButtonWithImage:(NSString *)imageName
{
    // setting
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnsClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    return button;
}

- (void)btnsClick:(UIButton *)button
{
    if (self.btnBlock) {
        self.btnBlock(button);
    }
}

@end
