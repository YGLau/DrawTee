//
//  YGAddressCell.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/8/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGAddressCell.h"

@implementation YGAddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"送貨地址";
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = colorWithRGBA(140, 140, 140, 1.0);
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.leading.equalTo(self.contentView.mas_leading).offset(20);
    }];
    
    UILabel *addrLabel = [[UILabel alloc] init];
    addrLabel.text = @"請選擇收貨地";
    addrLabel.textColor = colorWithRGBA(206, 206, 206, 1.0);
    addrLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:addrLabel];
    [addrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
        make.leading.equalTo(titleLabel.mas_leading);
    }];
    
    UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"to add"]];
    [self.contentView addSubview:arrowImage];
    [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-15);
    }];
}

@end
