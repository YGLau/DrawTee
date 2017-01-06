//
//  YGTeeView.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/7/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGTeeView.h"

@interface YGTeeView ()

@property (weak, nonatomic) UIImageView *teePic;

@end

@implementation YGTeeView

- (instancetype)initWithImage:(UIImage *)image
{
    if (self = [super initWithImage:image]) {
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UIImageView *teePic = [[UIImageView alloc] init];
    teePic.backgroundColor = [UIColor randomColor];
    [self addSubview:teePic];
    self.teePic = teePic;
    [teePic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(90);
        make.centerX.equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

@end
