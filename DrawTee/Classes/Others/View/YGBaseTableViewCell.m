//
//  YGBaseTableViewCell.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/8/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGBaseTableViewCell.h"

@implementation YGBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.layer.cornerRadius = 10;
        self.contentView.layer.masksToBounds = YES;
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(-5);
        }];
    }
    return self;
}

@end
