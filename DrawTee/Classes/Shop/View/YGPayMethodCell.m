//
//  YGPayMethodCell.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/8/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGPayMethodCell.h"
#import "YGPayButton.h"

@interface YGPayMethodCell ()

@end

@implementation YGPayMethodCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UILabel *mehodLabel = [[UILabel alloc] init];
    mehodLabel.text = @"請選擇支付方式";
    mehodLabel.textColor = colorWithRGBA(110, 110, 110, 1.0);
    [self.contentView addSubview:mehodLabel];
    [mehodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.leading.equalTo(self.contentView.mas_leading).offset(20);
        //        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    UIView *firLine = [[UIView alloc] init];
    firLine.backgroundColor = colorWithRGBA(232, 232, 232, 1.0);
    [self.contentView addSubview:firLine];
    [firLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mehodLabel.mas_bottom).offset(15);
        make.leading.equalTo(mehodLabel.mas_leading);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-20);
        make.height.mas_equalTo(1);
    }];
    
    YGPayButton *applePay = [YGPayButton buttonWithType:UIButtonTypeCustom];
    [applePay setImage:[UIImage imageNamed:@"apple_pay"] forState:UIControlStateNormal];
    [applePay addTarget:self action:@selector(payButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:applePay];
    [applePay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(firLine);
    }];
    
    UIView *secLine = [[UIView alloc] init];
    secLine.backgroundColor = colorWithRGBA(232, 232, 232, 1.0);
    [self.contentView addSubview:secLine];
    [secLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(applePay.mas_bottom);
        make.leading.trailing.height.equalTo(firLine);
    }];
    
    YGPayButton *payPal = [YGPayButton buttonWithType:UIButtonTypeCustom];
    [payPal setImage:[UIImage imageNamed:@"paypal"] forState:UIControlStateNormal];
    [payPal addTarget:self action:@selector(payButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:payPal];
    [payPal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(secLine);
        make.size.equalTo(applePay);
    }];
    
    UIView *thirdLine = [[UIView alloc] init];
    thirdLine.backgroundColor = colorWithRGBA(232, 232, 232, 1.0);
    [self.contentView addSubview:thirdLine];
    [thirdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(payPal.mas_bottom);
        make.leading.trailing.height.equalTo(secLine);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];

}

- (void)payButtonClick:(YGPayButton *)button
{
    button.buttonState = !button.buttonState;
    if (button.buttonState == payButtonSelected) {
        [button setImageFlagWithButtonState:payButtonSelected];
    } else {
        [button setImageFlagWithButtonState:payButtonNormal];
    }
}

@end
