//
//  YGAddressViewCell.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/6/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGAddressViewCell.h"

@interface YGAddressViewCell ()

@property (weak, nonatomic) UILabel *nameLabel;

@property (weak, nonatomic) UILabel *phoneLabel;

@property (weak, nonatomic) UILabel *addrLabel;

@end

@implementation YGAddressViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = colorWithRGBA(242, 242, 242, 1.0);
        self.contentView.layer.cornerRadius = 10;
        self.contentView.layer.masksToBounds = YES;
        [self setupChildWidgets];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(-5);
            make.top.leading.trailing.equalTo(self);
        }];
    }
    return self;
}

- (void)setupChildWidgets
{
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.textColor = colorWithRGBA(97, 97, 97, 1.0);
//    nameLabel.backgroundColor = [UIColor randomColor];
    nameLabel.text = @"鬧鬧";
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(30);
        make.leading.equalTo(self.contentView.mas_leading).offset(20);
        make.height.mas_equalTo(20);
    }];
    
    UILabel *phoneLabel = [[UILabel alloc] init];
    phoneLabel.textColor = colorWithRGBA(97, 97, 97, 1.0);
//    phoneLabel.backgroundColor = [UIColor randomColor];
    phoneLabel.textAlignment = NSTextAlignmentRight;
    phoneLabel.text = @"15965555135";
    [self.contentView addSubview:phoneLabel];
    self.phoneLabel = phoneLabel;
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.height.equalTo(nameLabel);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-20);
    }];
    
    UILabel *addrLabel = [[UILabel alloc] init];
    addrLabel.textColor = colorWithRGBA(97, 97, 97, 1.0);
    addrLabel.font = [UIFont systemFontOfSize:17.0];
    addrLabel.text = @"三年30次会：习近平的全面深改“加速度”的全面深改“加的全面深改“加的全面深改“加";
    addrLabel.numberOfLines = 0;
//    addrLabel.backgroundColor = [UIColor randomColor];
    [self.contentView addSubview:addrLabel];
    self.addrLabel = addrLabel;
    [addrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(10);
        make.leading.equalTo(nameLabel.mas_leading);
        make.trailing.equalTo(phoneLabel.mas_trailing);
        
    }];
    
    UIView *sepLine = [[UIView alloc] init];
    sepLine.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [self.contentView addSubview:sepLine];
    [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(addrLabel.mas_bottom).offset(20);
        make.leading.and.trailing.equalTo(addrLabel);
        make.height.mas_equalTo(1);
    }];
    
    UIButton *defaultSelBtn = [[UIButton alloc] init];
//    defaultSelBtn.backgroundColor = [UIColor randomColor];
    [defaultSelBtn setTitleColor:colorWithRGBA(97, 97, 97, 1.0) forState:UIControlStateNormal];
    [defaultSelBtn setTitleColor:colorWithRGBA(97, 97, 97, 1.0) forState:UIControlStateSelected];
    defaultSelBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    defaultSelBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -15);
    [defaultSelBtn setTitle:@"設為默認" forState:UIControlStateNormal];
    [defaultSelBtn setTitle:@"默認地址" forState:UIControlStateSelected];
    [defaultSelBtn setImage:[UIImage imageNamed:@"icon_choose_no"] forState:UIControlStateNormal];
    [defaultSelBtn setImage:[UIImage imageNamed:@"icon_choose_yes"] forState:UIControlStateSelected];
    [self.contentView addSubview:defaultSelBtn];
    [defaultSelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sepLine.mas_bottom).offset(15);
        make.leading.equalTo(sepLine);
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.bottom.equalTo(self.mas_bottom).offset(-15);
    }];
    
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [editBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [editBtn setTitleColor:colorWithRGBA(77, 209, 224, 1.0) forState:UIControlStateNormal];
    [editBtn setTitle:@"編輯" forState:UIControlStateNormal];
    [editBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    editBtn.layer.cornerRadius = 20;
    editBtn.layer.masksToBounds = YES;
    editBtn.layer.borderWidth = 2;
    editBtn.layer.borderColor = colorWithRGBA(77, 209, 224, 1.0).CGColor;
    editBtn.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:editBtn];
    [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(defaultSelBtn.mas_centerY);
        make.size.equalTo(defaultSelBtn);
    }];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [deleteBtn setTitleColor:colorWithRGBA(77, 209, 224, 1.0) forState:UIControlStateNormal];
    deleteBtn.layer.cornerRadius = editBtn.layer.cornerRadius;
    deleteBtn.layer.borderWidth = editBtn.layer.borderWidth;
    deleteBtn.layer.borderColor = colorWithRGBA(77, 209, 224, 1.0).CGColor;
    deleteBtn.layer.masksToBounds = YES;
    deleteBtn.backgroundColor = [UIColor whiteColor];
    [deleteBtn setTitle:@"刪除" forState:UIControlStateNormal];
    [self.contentView addSubview:deleteBtn];
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(editBtn.mas_centerY);
        make.size.equalTo(editBtn);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-20);
        make.leading.equalTo(editBtn.mas_trailing).offset(10);
    }];
    
}

- (void)buttonClick
{
    if (self.editBliock) {
        self.editBliock();
    }
}
















@end
