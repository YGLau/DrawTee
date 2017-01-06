//
//  YGUploadView.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/7/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGUploadView.h"

@implementation YGUploadView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupChildWedgets];
    }
    return self;
}

- (void)setupChildWedgets
{
    UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"border"]];
    bgImage.backgroundColor = [UIColor randomColor];
    [self addSubview:bgImage];
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.trailing.equalTo(self);
        make.height.mas_equalTo(kMainScreenW == 320 ? 90 : 120);
    }];
    
    UILabel *sizeLabel = [[UILabel alloc] init];
    sizeLabel.backgroundColor = colorWithRGBA(65, 65, 65, 1.0);
    sizeLabel.text = @"尺寸";
    sizeLabel.textAlignment = NSTextAlignmentRight;
    [bgImage addSubview:sizeLabel];
    
    
    UIButton *chioceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    chioceBtn.backgroundColor = colorWithRGBA(242, 242, 242, 1.0);
    [chioceBtn setImage:[UIImage imageNamed:@"icon_pull"] forState:UIControlStateNormal];
    [chioceBtn setTitle:@"3-4岁" forState:UIControlStateNormal];
    chioceBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 120, 0, 0);
    chioceBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [chioceBtn setTitleColor:colorWithRGBA(65, 65, 65, 1.0) forState:UIControlStateNormal];
    chioceBtn.layer.cornerRadius = 20;
    chioceBtn.layer.masksToBounds = YES;
    [bgImage addSubview:chioceBtn];
    [chioceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgImage.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(150, 40));
        make.leading.equalTo(sizeLabel.mas_trailing).offset(15);
    }];
    
    [sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(bgImage.mas_leading);
        make.centerY.equalTo(chioceBtn.mas_centerY);
        make.width.mas_equalTo(50);
    }];
    
    UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    likeBtn.backgroundColor = [UIColor randomColor];
    [likeBtn setImage:[UIImage imageNamed:@"icon_like"] forState:UIControlStateSelected];
    [likeBtn setImage:[UIImage imageNamed:@"icon_deflike"] forState:UIControlStateNormal];
    [bgImage addSubview:likeBtn];
    [likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(chioceBtn.mas_centerY);
        make.trailing.equalTo(bgImage.mas_trailing).offset(-20);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    UIButton *priceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    priceBtn.backgroundColor = [UIColor randomColor];
    [priceBtn setImage:[UIImage imageNamed:@"icon_money"] forState:UIControlStateNormal];
    [self addSubview:priceBtn];
    [priceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgImage.mas_bottom).offset(20);
        make.leading.equalTo(self.mas_leading).offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    
    UILabel *countLabel =[[UILabel alloc] init];
    countLabel.text = @"數量";
    countLabel.textAlignment = NSTextAlignmentRight;
    countLabel.textColor = colorWithRGBA(90, 90, 90, 1.0);
    //    userLabel.backgroundColor = [UIColor randomColor];
    [self addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(priceBtn.mas_trailing).offset(20);
        make.centerY.equalTo(priceBtn.mas_centerY);
    }];
    
    UIButton *addToCart = [UIButton buttonWithType:UIButtonTypeCustom];
    addToCart.layer.cornerRadius = 25;
    addToCart.layer.masksToBounds = YES;
    addToCart.backgroundColor = colorWithRGBA(237, 103, 30, 1.0);
    [addToCart setTitle:@"加入購物車" forState:UIControlStateNormal];
    [addToCart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:addToCart];
    [addToCart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset((kMainScreenW - 300) / 3);
        make.top.equalTo(priceBtn.mas_bottom).offset(kMainScreenW == 320 ? 15 : 30);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(self.mas_bottom).offset(kMainScreenW == 320 ? -15 : -30);
        make.width.mas_equalTo(150);
    }];
    
    UIButton *purNow = [UIButton buttonWithType: UIButtonTypeCustom];
    purNow.layer.cornerRadius = 25;
    purNow.layer.masksToBounds = YES;
    purNow.backgroundColor = colorWithRGBA(145, 197, 70, 1.0);
    purNow.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [purNow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [purNow setTitle:@"立即購買" forState:UIControlStateNormal];
    [self addSubview:purNow];
    [purNow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(addToCart.mas_centerY);
        make.trailing.equalTo(self.mas_trailing).offset(-(kMainScreenW - 300) / 3);
        make.size.equalTo(addToCart);
    }];
}

@end
