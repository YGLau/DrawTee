//
//  YGModificationView.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/6/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGModificationView.h"

@interface YGModificationView ()

@property (weak, nonatomic) UILabel *deAreaLabel;

@property (weak, nonatomic) UITextView *detailArea;

@property (weak, nonatomic) UIView *thirdLine;

@property (weak, nonatomic) UITextField *nameInput;

@property (weak, nonatomic) UIButton *areaBtn;

@end

@implementation YGModificationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = colorWithRGBA(242, 242, 242, 1.0);
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        [self setupChildWidgets];
    }
    return self;
}

- (void)setupChildWidgets
{
    UILabel *userLabel =[[UILabel alloc] init];
    userLabel.text = @"收貨人";
    userLabel.textColor = colorWithRGBA(106, 106, 106, 1.0);
//    userLabel.backgroundColor = [UIColor randomColor];
    [self addSubview:userLabel];
    [userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(30);
        make.leading.equalTo(self.mas_leading).offset(20);
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    UITextField *nameInput = [[UITextField alloc] init];
    nameInput.placeholder = @"姓名";
    nameInput.textColor = colorWithRGBA(106, 106, 106, 1.0);
//    nameInput.font = [UIFont systemFontOfSize:13.0];
//    nameInput.backgroundColor = [UIColor randomColor];
    [self addSubview:nameInput];
    self.nameInput = nameInput;
    [nameInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(userLabel);
        make.leading.equalTo(userLabel.mas_trailing).offset(10);
        make.trailing.equalTo(self.mas_trailing).offset(-20);
    }];
    
    UIView *firstLine = [[UIView alloc] init];
    firstLine.backgroundColor = colorWithRGBA(223, 223, 223, 1.0);
    [self addSubview:firstLine];
    [firstLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.equalTo(userLabel.mas_bottom).offset(10);
        make.leading.equalTo(userLabel.mas_leading);
        make.trailing.equalTo(nameInput.mas_trailing);
    }];
    
    UILabel *phoneLabel = [[UILabel alloc] init];
    phoneLabel.text = @"手機號碼";
    phoneLabel.textColor = colorWithRGBA(106, 106, 106, 1.0);
//    phoneLabel.backgroundColor = [UIColor randomColor];
    [self addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstLine.mas_bottom).offset(10);
        make.leading.equalTo(firstLine.mas_leading);
        make.size.equalTo(userLabel);
    }];
    
    UITextField *numberInput = [[UITextField alloc] init];
    numberInput.textColor = colorWithRGBA(106, 106, 106, 1.0);
//    numberInput.backgroundColor = [UIColor randomColor];
    [self addSubview:numberInput];
    [numberInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(phoneLabel);
        make.leading.equalTo(nameInput.mas_leading);
    }];
    
    UIButton *addrBook = [UIButton buttonWithType:UIButtonTypeCustom];
    [addrBook setImage:[UIImage imageNamed:@"number"] forState:UIControlStateNormal];
    [self addSubview:addrBook];
    [addrBook mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneLabel.mas_centerY);
        make.trailing.equalTo(firstLine.mas_trailing);
        make.size.mas_equalTo(CGSizeMake(40, 30));
        make.leading.equalTo(numberInput.mas_trailing).offset(10);
    }];
    
    UIView *secondLine = [[UIView alloc] init];
    secondLine.backgroundColor = colorWithRGBA(223, 223, 223, 1.0);
    [self addSubview:secondLine];
    [secondLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.equalTo(phoneLabel.mas_bottom).offset(10);
        make.leading.and.trailing.equalTo(firstLine);
    }];
    
    UILabel *areaLabel =[[UILabel alloc] init];
    areaLabel.text = @"省市區";
    areaLabel.textColor = colorWithRGBA(106, 106, 106, 1.0);
//    areaLabel.backgroundColor = [UIColor randomColor];
    [self addSubview:areaLabel];
    [areaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secondLine.mas_bottom).offset(10);
        make.leading.equalTo(secondLine.mas_leading);
        make.size.equalTo(userLabel);
    }];
    
    UIButton *areaBtn = [UIButton buttonWithType: UIButtonTypeCustom];
//    areaBtn.backgroundColor = [UIColor randomColor];
    areaBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [areaBtn setTitleColor:colorWithRGBA(106, 106, 106, 1.0) forState:UIControlStateNormal];
//    [areaBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [self addSubview:areaBtn];
    self.areaBtn = areaBtn;
    [areaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(areaLabel.mas_centerY);
        make.trailing.equalTo(secondLine.mas_trailing);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    UIView *thirdLine = [[UIView alloc] init];
    thirdLine.backgroundColor = colorWithRGBA(223, 223, 223, 1.0);
    [self addSubview:thirdLine];
    self.thirdLine = thirdLine;
    [thirdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.leading.and.trailing.equalTo(secondLine);
        make.top.equalTo(areaLabel.mas_bottom).offset(10);
    }];
    
    UILabel *deAreaLabel = [[UILabel alloc] init];
    deAreaLabel.text = @"詳細地址";
    deAreaLabel.textColor = colorWithRGBA(106, 106, 106, 1.0);
//    deAreaLabel.backgroundColor = [UIColor randomColor];
    [self addSubview:deAreaLabel];
    self.deAreaLabel = deAreaLabel;
    
    UITextView *detailArea = [[UITextView alloc] init];
    detailArea.backgroundColor = [UIColor clearColor];
    detailArea.font = [UIFont systemFontOfSize:15.0];
    detailArea.text = @"jdoisadhfwioshfdk'lhfvdskllhfvdsklhlhfvdsklhlhfvdsklhlhfvdsklhhdkofhdkljahds";
    detailArea.textColor = colorWithRGBA(106, 106, 106, 1.0);
    [self addSubview:detailArea];
    self.detailArea = detailArea;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.viewType == modificationViewAdd) { // add a new
        [self.detailArea mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.thirdLine.mas_bottom).offset(10);
            make.leading.and.trailing.equalTo(self.thirdLine);
            make.bottom.equalTo(self.mas_bottom).offset(-20);
        }];
        self.deAreaLabel.hidden = YES;
        [self.areaBtn setImage:[UIImage imageNamed:@"map"] forState:UIControlStateNormal];
        self.areaBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -120);
    } else {
        [self.detailArea mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.thirdLine.mas_bottom).offset(10);
            make.trailing.equalTo(self.thirdLine.mas_trailing);
            make.leading.equalTo(self.nameInput.mas_leading);
            make.bottom.equalTo(self.mas_bottom).offset(-20);
        }];
        self.deAreaLabel.hidden = NO;
        [self.deAreaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.thirdLine.mas_bottom).offset(18);
            make.leading.equalTo(self.thirdLine.mas_leading);
            make.size.mas_equalTo(CGSizeMake(70, 20));
        }];
        [self.areaBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
        [self.areaBtn setTitle:@"廣東 深圳 南山區" forState:UIControlStateNormal];
        self.areaBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -240);
        self.areaBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    }
    
}

@end
