//
//  YGOrderCell.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/7/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGOrderCell.h"

@implementation YGOrderCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupChildWidgets];
        self.contentView.layer.cornerRadius = 10;
        self.contentView.layer.masksToBounds = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(-5);
        }];
    }
    return self;
}

- (void)setupChildWidgets
{
    UIImageView *tshirtPic = [[UIImageView alloc] init];
    tshirtPic.backgroundColor = [UIColor randomColor];
    [self.contentView addSubview:tshirtPic];
    [tshirtPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.leading.equalTo(self.contentView.mas_leading).offset(20);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    UILabel *ageLabel = [[UILabel alloc] init];
    ageLabel.text = @"尺寸 3-4岁";
    ageLabel.textColor = colorWithRGBA(93, 93, 93, 1.0);
    ageLabel.backgroundColor = [UIColor randomColor];
    [self.contentView addSubview:ageLabel];
    [ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tshirtPic.mas_top).offset(5);
        make.leading.equalTo(tshirtPic.mas_trailing).offset(10);
        make.size.mas_equalTo(CGSizeMake(120, 30));
    }];
    
    UILabel *countLabel = [[UILabel alloc] init];
    countLabel.text = @"x1";
    countLabel.textColor = colorWithRGBA(93, 93, 93, 1.0);
    [self.contentView addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ageLabel.mas_bottom).offset(5);
        make.leading.equalTo(ageLabel.mas_leading);
        make.width.mas_equalTo(60);
        make.height.equalTo(ageLabel.mas_height);
    }];
    
    UILabel *orderState = [[UILabel alloc] init];
    orderState.backgroundColor = [UIColor randomColor];
    orderState.text = @"交易成功";
    orderState.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:orderState];
    [orderState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ageLabel.mas_top);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-20);
        make.size.equalTo(ageLabel);
    }];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.text = @"$110";
    priceLabel.textAlignment = NSTextAlignmentRight;
    priceLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(tshirtPic.mas_bottom);
        make.trailing.equalTo(orderState.mas_trailing);
        make.size.equalTo(orderState);
    }];
    
    UIView *firLine = [[UIView alloc] init];
    firLine.backgroundColor = colorWithRGBA(228, 228, 228, 1.0);
    [self.contentView addSubview:firLine];
    [firLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tshirtPic.mas_bottom).offset(15);
        make.leading.equalTo(tshirtPic.mas_leading);
        make.trailing.equalTo(orderState.mas_trailing);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *goodNum = [[UILabel alloc] init];
    goodNum.textColor = colorWithRGBA(244, 133, 51, 1.0);
    goodNum.text = @"總計1件商品";
    goodNum.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:goodNum];
    [goodNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firLine.mas_bottom).offset(15);
        make.leading.equalTo(firLine.mas_leading).offset(5);
        make.size.equalTo(ageLabel);
    }];
    
    UILabel *totalMoney = [[UILabel alloc] init];
    totalMoney.text = @"合計$110(含運費$0)";
    totalMoney.textAlignment = NSTextAlignmentRight;
    totalMoney.backgroundColor = [UIColor randomColor];
    [self.contentView addSubview:totalMoney];
    [totalMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(goodNum.mas_top);
        make.trailing.equalTo(firLine.mas_trailing);
        make.height.equalTo(goodNum.mas_height);
        make.leading.equalTo(goodNum.mas_trailing);
    }];
    
    UIView *secLine = [[UIView alloc] init];
    secLine.backgroundColor = colorWithRGBA(228, 228, 228, 1.0);
    [self.contentView addSubview:secLine];
    [secLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(goodNum.mas_bottom).offset(15);
        make.leading.and.trailing.and.height.equalTo(firLine);
    }];
    
    UIButton *detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [detailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [detailBtn setTitleColor:colorWithRGBA(77, 209, 224, 1.0) forState:UIControlStateNormal];
    [detailBtn setTitle:@"訂單詳情" forState:UIControlStateNormal];
    [detailBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    detailBtn.layer.cornerRadius = 20;
    detailBtn.layer.masksToBounds = YES;
    detailBtn.layer.borderWidth = 2;
    detailBtn.layer.borderColor = colorWithRGBA(77, 209, 224, 1.0).CGColor;
    detailBtn.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:detailBtn];
    [detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(defaultSelBtn.mas_centerY);
        make.top.equalTo(secLine.mas_bottom).offset(15);
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);
    }];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [deleteBtn setTitleColor:colorWithRGBA(77, 209, 224, 1.0) forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    deleteBtn.layer.cornerRadius = detailBtn.layer.cornerRadius;
    deleteBtn.layer.borderWidth = detailBtn.layer.borderWidth;
    deleteBtn.layer.borderColor = colorWithRGBA(77, 209, 224, 1.0).CGColor;
    deleteBtn.layer.masksToBounds = YES;
    deleteBtn.backgroundColor = [UIColor whiteColor];
    [deleteBtn setTitle:@"刪除訂單" forState:UIControlStateNormal];
    [self.contentView addSubview:deleteBtn];
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(detailBtn.mas_centerY);
        make.size.equalTo(detailBtn);
        make.leading.equalTo(detailBtn.mas_trailing).offset(10);
    }];
    
    UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [commentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [commentBtn setTitleColor:colorWithRGBA(77, 209, 224, 1.0) forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    commentBtn.layer.cornerRadius = detailBtn.layer.cornerRadius;
    commentBtn.layer.borderWidth = detailBtn.layer.borderWidth;
    commentBtn.layer.borderColor = colorWithRGBA(77, 209, 224, 1.0).CGColor;
    commentBtn.layer.masksToBounds = YES;
    commentBtn.backgroundColor = [UIColor whiteColor];
    [commentBtn setTitle:@"評價" forState:UIControlStateNormal];
    [self.contentView addSubview:commentBtn];
    [commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(detailBtn.mas_centerY);
        make.size.equalTo(detailBtn);
        make.leading.equalTo(deleteBtn.mas_trailing).offset(10);
        make.trailing.equalTo(secLine.mas_trailing);
    }];
}

- (void)buttonClick:(UIButton *)button
{
    NSLog(@"---");
}

@end
