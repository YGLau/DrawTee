//
//  YGOtherLoginView.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/5/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGOtherLoginView.h"

@implementation YGOtherLoginView

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
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"用以下方式登入";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:20.0];
    titleLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    
    UIButton *facebook = [UIButton buttonWithType:UIButtonTypeCustom];
    facebook.layer.cornerRadius = kMainScreenW == 320 ? 25 : 30;
    facebook.layer.masksToBounds = YES;
    [facebook setTitle:@"facebook" forState:UIControlStateNormal];
    [facebook setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [facebook addTarget:self action:@selector(facebookOrWechatButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    facebook.backgroundColor = colorWithRGBA(79, 115, 177, 1.0);
    [self addSubview:facebook];
    [facebook mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom);
        make.leading.trailing.equalTo(self);
        make.height.mas_equalTo(kMainScreenW == 320 ? 50 : 60);
    }];
    
    UIButton *weChat = [UIButton buttonWithType:UIButtonTypeCustom];
    weChat.layer.cornerRadius = facebook.layer.cornerRadius;
    weChat.layer.masksToBounds = YES;
    [weChat setTitle:@"wechat" forState:UIControlStateNormal];
    [weChat setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [weChat addTarget:self action:@selector(facebookOrWechatButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    weChat.backgroundColor = colorWithRGBA(52, 202, 112, 1.0);
    [self addSubview:weChat];
    [weChat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(facebook.mas_bottom).offset(10);
        make.leading.trailing.width.height.equalTo(facebook);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}

- (void)facebookOrWechatButtonClick:(UIButton *)button
{
    NSLog(@"---");
}
@end
