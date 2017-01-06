//
//  YGPayButton.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/8/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGPayButton.h"

@interface YGPayButton ()

@property (weak, nonatomic) UIImageView *selectFlag;

@end

@implementation YGPayButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *selectImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_choose_no"]];
        [self addSubview:selectImage];
        self.selectFlag = selectImage;
        if (kMainScreenW == 375) { // 4.7 inch
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -200, 0, 0);
        } else if (kMainScreenW == 414){ // 5.5 inch
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -250, 0, 0);
        } else if (kMainScreenW == 320) {
            
        } else if (kMainScreenW == 768) { // iPad Air
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -550, 0, 0);
        } else if (kMainScreenW == 1024) { // iPad Pro 12.9 inch
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -850, 0, 0);
        }
        [selectImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.trailing.equalTo(self.mas_trailing).offset(-5);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return self;
}

- (void)setImageFlagWithButtonState:(PayButtonState)state
{
    if (state == payButtonSelected) {
        self.selectFlag.image = [UIImage imageNamed:@"icon_choose_yes"];
    } else {
        self.selectFlag.image = [UIImage imageNamed:@"icon_choose_no"];
    }
}

@end
