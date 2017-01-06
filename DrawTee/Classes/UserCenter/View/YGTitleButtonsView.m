//
//  YGTitleButtonsView.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/6/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGTitleButtonsView.h"

@interface YGTitleButtonsView ()

@property (strong, nonatomic) NSArray *titleArr;

@property (strong, nonatomic) NSMutableArray *buttonsArr;

@property (weak, nonatomic) UIButton *selectedBtn;

@property (weak, nonatomic) UIView *indicator;

@property (weak, nonatomic) MASConstraint *centerX;
@end

@implementation YGTitleButtonsView

- (NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = @[@"全部", @"待付款", @"待發貨", @"待收貨", @"待評價"];
    }
    return _titleArr;
}

- (NSMutableArray *)buttonsArr
{
    if (!_buttonsArr) {
        _buttonsArr = [NSMutableArray array];
    }
    return _buttonsArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    for (NSInteger i = 0; i < self.titleArr.count; i++) {
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.tag = i;
//        titleBtn.backgroundColor = [UIColor randomColor];
        [titleBtn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:colorWithRGBA(106, 106, 106, 1.0) forState:UIControlStateNormal];
        [titleBtn setTitleColor:colorWithRGBA(131, 191, 0, 1.0) forState:UIControlStateDisabled];
        [titleBtn addTarget:self action:@selector(titleButtonsClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleBtn setTitleColor:colorWithRGBA(149, 149, 149, 1.0) forState:UIControlStateNormal];
        [self addSubview:titleBtn];
        [self.buttonsArr addObject:titleBtn];
    }
    
    [self.buttonsArr[0] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(15);
        make.leading.equalTo(self.mas_leading).offset(20);
        make.bottom.equalTo(self.mas_bottom).offset(-15);
    }];
    [self.buttonsArr[1] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(((UIButton *)self.buttonsArr[0]));
        make.leading.equalTo(((UIButton *)self.buttonsArr[0]).mas_trailing);
        make.size.equalTo(((UIButton *)self.buttonsArr[0]));
    }];
    [self.buttonsArr[2] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(((UIButton *)self.buttonsArr[0]));
        make.leading.equalTo(((UIButton *)self.buttonsArr[1]).mas_trailing);
        make.size.equalTo(((UIButton *)self.buttonsArr[0]));
    }];
    [self.buttonsArr[3] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(((UIButton *)self.buttonsArr[0]));
        make.leading.equalTo(((UIButton *)self.buttonsArr[2]).mas_trailing);
        make.size.equalTo(((UIButton *)self.buttonsArr[0]));
    }];
    [self.buttonsArr[4] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(((UIButton *)self.buttonsArr[0]));
        make.leading.equalTo(((UIButton *)self.buttonsArr[3]).mas_trailing);
        make.trailing.equalTo(self.mas_trailing).offset(-20);
        make.size.equalTo(((UIButton *)self.buttonsArr[0]));
    }];
    
    UIView *indicator = [[UIView alloc] init];
    self.indicator = indicator;
    indicator.backgroundColor = colorWithRGBA(131, 191, 0, 1.0);
    [self addSubview:indicator];
    __weak typeof(self) weakSelf = self;
    [indicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(3);
        make.width.equalTo(((UIButton *)self.buttonsArr[0]).titleLabel.mas_width);
        make.top.equalTo(self.mas_bottom).offset(-20);
        weakSelf.centerX = make.centerX.equalTo(((UIButton *)self.buttonsArr[0]).mas_centerX);
    }];
}

- (void)setSelectButtonStyle:(UIButton *)selectedBtn
{
    selectedBtn.enabled = NO;
    self.selectedBtn.enabled = YES;
    self.selectedBtn = selectedBtn;
    // move indicator view
    [UIView animateWithDuration:0.25 animations:^{
        [self.indicator mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(3);
            make.width.equalTo(((UIButton *)self.buttonsArr[selectedBtn.tag]).titleLabel.mas_width);
            make.top.equalTo(self.mas_bottom).offset(-20);
            make.centerX.equalTo(((UIButton *)self.buttonsArr[selectedBtn.tag]).mas_centerX);
        }];
        [self layoutIfNeeded];
    }];
}

- (void)titleButtonsClick:(UIButton *)button
{
    [self setSelectButtonStyle:button];
    // call delegate
    if ([self.delegate respondsToSelector:@selector(titleBtnsDidClick:)]) {
        [self.delegate titleBtnsDidClick:button];
    }
}

@end
