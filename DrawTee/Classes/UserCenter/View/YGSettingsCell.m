//
//  YGSettingsCell.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/5/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGSettingsCell.h"

@interface YGSettingsCell ()

@property (weak, nonatomic) UIView *sepLine;

@property (weak, nonatomic) UILabel *titleLabel;

@end

@implementation YGSettingsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = colorWithRGBA(119, 119, 119, 1.0);
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.leading.equalTo(self.contentView.mas_leading).offset(10);
        make.height.mas_equalTo(30);
    }];
    
    UIImageView *indicatorView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"go"]];
    [self.contentView addSubview:indicatorView];
    [indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-15);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(15);
    }];
    
    UIView *sepLine = [[UIView alloc] init];
    sepLine.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    [self.contentView addSubview:sepLine];
    self.sepLine = sepLine;
    [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).offset(15);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-15);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(1);
    }];
}

- (void)removeSeparatorLine
{
    self.sepLine.hidden = YES;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
