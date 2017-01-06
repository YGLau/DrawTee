//
//  YGModificationAddrController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/6/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGModificationAddrController.h"
#import "YGModificationView.h"

@interface YGModificationAddrController ()

@end

@implementation YGModificationAddrController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.isAddFlag ? @"新增地址" : @"修改地址";
    
    YGModificationView *modView = [[YGModificationView alloc] init];
    modView.viewType = self.isAddFlag ? modificationViewAdd : ModificationViewEdit;
    [self.view addSubview:modView];
    [modView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(70);
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.height.mas_equalTo(250);
    }];
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.backgroundColor = colorWithRGBA(145, 197, 70, 1.0);
    saveBtn.layer.cornerRadius = 30;
    saveBtn.layer.masksToBounds = YES;
    saveBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [self.view addSubview:saveBtn];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) { 
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.height.mas_equalTo(60);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
    }];
}

@end
