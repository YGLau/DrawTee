//
//  YGVerticalButton.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/5/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGVerticalButton.h"

@interface YGVerticalButton ()

@property (weak, nonatomic) UILabel *badgeLabel;

@end

@implementation YGVerticalButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor randomColor];
        [self addBadgeView];
//        self.imageView.backgroundColor = [UIColor randomColor];
//        self.titleLabel.backgroundColor = [UIColor randomColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((contentRect.size.width - 30) * 0.5, (contentRect.size.height - 54) / 1.5, 30, 24);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 50, contentRect.size.width, 20);
}

- (void)addBadgeView
{
    UILabel *badgeLabel = [[UILabel alloc] init];
    badgeLabel.layer.cornerRadius = 10;
    badgeLabel.layer.masksToBounds = YES;
    badgeLabel.backgroundColor = colorWithRGBA(145, 197, 70, 1.0);
    badgeLabel.textColor = [UIColor whiteColor];
    badgeLabel.textAlignment = NSTextAlignmentCenter;
    badgeLabel.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:badgeLabel];
    self.badgeLabel = badgeLabel;
    [badgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.trailing.equalTo(self.mas_trailing).offset(-40);
        make.height.and.width.mas_equalTo(20);
    }];
}

- (void)setBadgeNumber:(NSInteger)number
{
    self.badgeLabel.text = [NSString stringWithFormat:@"%zd", number];
}

@end
