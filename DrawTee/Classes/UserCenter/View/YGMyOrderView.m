//
//  YGMyOrderView.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/4/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGMyOrderView.h"

@interface YGMyOrderView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation YGMyOrderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"我的作品集";
    titleLabel.font = [UIFont systemFontOfSize:17.0];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(15);
        make.leading.equalTo(self.mas_leading).offset(15);
    }];
    UIView *sepLine = [[UIView alloc] init];
    sepLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:sepLine];
    [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.mas_trailing).offset(-15);
        make.leading.equalTo(self.mas_leading).offset(15);
        make.height.mas_equalTo(1);
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
    }];
    
    UICollectionViewFlowLayout *waterLayout = [[UICollectionViewFlowLayout alloc] init];
    waterLayout.itemSize = CGSizeMake(100, 100);
    waterLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    waterLayout.minimumInteritemSpacing = 20;
    waterLayout.minimumLineSpacing = 15;
    UICollectionView *orderView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:waterLayout];
    orderView.backgroundColor = [UIColor whiteColor];
    orderView.showsVerticalScrollIndicator = NO;
    orderView.delegate = self;
    orderView.dataSource = self;
    [self addSubview:orderView];
    [orderView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"orderCell"];
    [orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sepLine.mas_bottom).offset(10);
        make.leading.equalTo(self.mas_leading).offset(15);
        make.trailing.equalTo(self.mas_trailing).offset(-15);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

#pragma mark - UICollectionViewDelegate
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"orderCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor randomColor];
    cell.layer.cornerRadius = 10;
    cell.layer.masksToBounds = YES;
    return cell;
}

@end
