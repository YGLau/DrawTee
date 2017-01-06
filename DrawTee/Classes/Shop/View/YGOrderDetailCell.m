//
//  YGOrderDetailCell.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/8/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGOrderDetailCell.h"

@implementation YGOrderDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UIImageView *tImage = [[UIImageView alloc] init];
    tImage.image = [UIImage imageNamed:@"tee"];
    tImage.backgroundColor = [UIColor randomColor];
    [self.contentView addSubview:tImage];
    [tImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.leading.equalTo(self.contentView.mas_leading).offset(15);
        make.width.mas_equalTo(kMainScreenW == 320 ? 50 : 65);
        make.height.mas_equalTo(70);
    }];
    
    UILabel *sizeLabel = [[UILabel alloc] init];
    sizeLabel.text = @"尺寸 3-4歲";
    sizeLabel.textColor = colorWithRGBA(110, 110, 110, 1.0);
    [self.contentView addSubview:sizeLabel];
    [sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tImage.mas_top).offset(10);
        make.leading.equalTo(tImage.mas_trailing).offset(20);
    }];
    
    UILabel *countLabel = [[UILabel alloc] init];
    countLabel.text = @"x1";
    countLabel.textColor = colorWithRGBA(110, 110, 110, 1.0);
//    countLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sizeLabel.mas_bottom).offset(10);
        make.leading.equalTo(sizeLabel.mas_leading);
        //        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    UILabel *countMoney = [[UILabel alloc] init];
    countMoney.text = @"$120";
    countMoney.textAlignment = NSTextAlignmentRight;
    countMoney.textColor = colorWithRGBA(235, 87, 0, 1.0);
    countMoney.font = [UIFont boldSystemFontOfSize:22.0];
    [self.contentView addSubview:countMoney];
    [countMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-20);
//        make.bottom.equalTo(tImage.mas_bottom);
        make.bottom.equalTo(countLabel.mas_bottom);
        //        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    UIView *firLine = [[UIView alloc] init];
    firLine.backgroundColor = colorWithRGBA(232, 232, 232, 1.0);
    [self.contentView addSubview:firLine];
    [firLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tImage.mas_bottom).offset(15);
        make.leading.equalTo(tImage.mas_leading);
        make.trailing.equalTo(countMoney.mas_trailing);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *postageLabel = [[UILabel alloc] init];
    postageLabel.text = @"運費";
    postageLabel.textColor = colorWithRGBA(92, 92, 92, 1.0);
    postageLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:postageLabel];
    [postageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firLine.mas_bottom).offset(10);
        make.leading.equalTo(firLine.mas_leading);
    }];
    
    UILabel *feeLabel = [[UILabel alloc] init];
    feeLabel.text = @"$0";
    feeLabel.textColor = colorWithRGBA(92, 92, 92, 1.0);
    feeLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:feeLabel];
    [feeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(postageLabel.mas_centerY);
        make.trailing.equalTo(firLine.mas_trailing);
    }];
    
    UIView *secLine = [[UIView alloc] init];
    secLine.backgroundColor = colorWithRGBA(232, 232, 232, 1.0);
    [self.contentView addSubview:secLine];
    [secLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(postageLabel.mas_bottom).offset(10);
        make.leading.trailing.height.equalTo(firLine);
    }];
    
    UILabel *countTitLab = [[UILabel alloc] init];
    countTitLab.text = @"數量";
    countTitLab.textColor = colorWithRGBA(92, 92, 92, 1.0);
    countTitLab.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:countTitLab];
    [countTitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secLine.mas_bottom).offset(10);
        make.leading.equalTo(secLine.mas_leading);
    }];
    
    UILabel *couLabel = [[UILabel alloc] init];
    couLabel.text = @"x1";
    couLabel.textColor = colorWithRGBA(92, 92, 92, 1.0);
    couLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:couLabel];
    [couLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(countTitLab.mas_centerY);
        make.trailing.equalTo(secLine.mas_trailing);
    }];
    
    UIView *thirdLine = [[UIView alloc] init];
    thirdLine.backgroundColor = colorWithRGBA(232, 232, 232, 1.0);
    [self.contentView addSubview:thirdLine];
    [thirdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(countTitLab.mas_bottom).offset(10);
        make.leading.trailing.height.equalTo(firLine);
    }];
    
    UIView *parView = [[UIView alloc] init];
    parView.layer.cornerRadius = 25;
    parView.layer.masksToBounds = YES;
    parView.backgroundColor = colorWithRGBA(239, 239, 239, 1.0);
    [self.contentView addSubview:parView];
    [parView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(thirdLine.mas_bottom).offset(10);
        make.leading.trailing.equalTo(thirdLine);
        make.height.mas_equalTo(40);
    }];
    
    UIImageView *talkImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_add"]];
    [parView addSubview:talkImage];
    [talkImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(parView.mas_centerY);
        make.leading.equalTo(parView.mas_leading).offset(15);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    
    UITextField *leaveMsg = [[UITextField alloc] init];
    leaveMsg.placeholder = @"買家留言";
    [parView addSubview:leaveMsg];
    [leaveMsg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.bottom.equalTo(parView);
        make.leading.equalTo(talkImage.mas_trailing).offset(10);
    }];
}

@end
