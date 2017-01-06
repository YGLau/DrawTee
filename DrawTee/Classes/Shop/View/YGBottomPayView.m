//
//  YGBottomPayView.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/8/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGBottomPayView.h"

@interface YGBottomPayView ()

@property (weak, nonatomic) UILabel *titleLabel;

@property (weak, nonatomic) UIButton *payButton;

@end

@implementation YGBottomPayView

- (instancetype)initWithImage:(UIImage *)image
{
    if (self = [super initWithImage:image]) {
        self.userInteractionEnabled = YES;
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UILabel *countLabel = [[UILabel alloc] init];
    countLabel.text = @"合計：$110";
    countLabel.textColor = colorWithRGBA(241, 132, 52, 1.0);
    countLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:countLabel];
    self.titleLabel = countLabel;
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-30);
        make.leading.equalTo(self.mas_leading).offset(20);
    }];
    
    UIButton *PayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    PayButton.backgroundColor = colorWithRGBA(249, 196, 6, 1.0);
    PayButton.layer.cornerRadius = 25;
    PayButton.layer.masksToBounds = YES;
    [PayButton setTitle:@"付款" forState:UIControlStateNormal];
    [PayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [PayButton addTarget:self action:@selector(payBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:PayButton];
    self.payButton = PayButton;
    [PayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(countLabel.mas_centerY);
        make.trailing.equalTo(self.mas_trailing).offset(-20);
        make.size.mas_equalTo(kMainScreenW == 320 ? CGSizeMake(120, 50) : CGSizeMake(180, 50));
    }];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setButtonTitle:(NSString *)buttonTitle
{
    _buttonTitle = buttonTitle;
    [self.payButton setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)payBtnClick
{
//    NSLog(@"---");
    if (self.payBlock) {
        self.payBlock();
    }
}

@end
