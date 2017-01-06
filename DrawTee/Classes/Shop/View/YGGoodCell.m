//
//  YGGoodCell.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/8/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGGoodCell.h"

@implementation YGGoodCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    selectBtn.backgroundColor = [UIColor randomColor];
    [selectBtn setImage:[UIImage imageNamed:@"icon_choose_no"] forState:UIControlStateNormal];
    [selectBtn setImage:[UIImage imageNamed:@"icon_choose_yes"] forState:UIControlStateSelected];
    [self.contentView addSubview:selectBtn];
    [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).offset(15);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    UIImageView *tImage = [[UIImageView alloc] init];
    tImage.image = [UIImage imageNamed:@"tee"];
    tImage.backgroundColor = [UIColor randomColor];
    [self.contentView addSubview:tImage];
    [tImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
        make.leading.equalTo(selectBtn.mas_trailing).offset(10);
        make.width.mas_equalTo(kMainScreenW == 320 ? 100 : 130);
    }];
    
    UILabel *sizeLabel = [[UILabel alloc] init];
    sizeLabel.text = @"尺寸 3-4歲";
    sizeLabel.textColor = colorWithRGBA(156, 156, 156, 1.0);
    [self.contentView addSubview:sizeLabel];
    [sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tImage.mas_top).offset(30);
        make.leading.equalTo(tImage.mas_trailing).offset(20);
//        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    UILabel *countLabel = [[UILabel alloc] init];
    countLabel.text = @"x1";
    countLabel.textColor = colorWithRGBA(234, 74, 0, 1.0);
    countLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sizeLabel.mas_bottom).offset(20);
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
        make.bottom.equalTo(tImage.mas_bottom);
//        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    
}

@end
