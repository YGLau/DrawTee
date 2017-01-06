//
//  YGUploadController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/7/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGUploadController.h"
#import "YGUploadView.h"
#import "YGTeeView.h"

@interface YGUploadController ()

@end

@implementation YGUploadController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = colorWithRGBA(255, 208, 43, 1.0);
    
    [self setupNav];
    
    [self setupTee];
    
    [self uploadView];
    
}

- (void)setupNav
{
    self.navigationController.navigationBar.hidden = NO;
    self.title =@"上傳照片";
    UIButton *cart = [UIButton buttonWithType:UIButtonTypeCustom];
    [cart setImage:[UIImage imageNamed:@"icon_cart"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cart];
}

- (void)setupTee
{
    
}

- (void)uploadView
{
    YGTeeView *teeView = [[YGTeeView alloc] initWithImage:[UIImage imageNamed:@"tee"]];
    teeView.backgroundColor = [UIColor randomColor];
    [self.view addSubview:teeView];
    
    
    YGUploadView *uploadView = [[YGUploadView alloc] init];
    uploadView.backgroundColor = [UIColor randomColor];
    [self.view addSubview:uploadView];
    [uploadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.view);
    }];
    
    [teeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(kMainScreenW == 320 ? 70 : 90);
//        make.leading.equalTo(self.view.mas_leading).offset(15);
//        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.bottom.equalTo(uploadView.mas_top).offset(-20);
        make.centerX.equalTo(self.view.mas_centerX);
//        make.height.mas_equalTo(300);
//        make.width.equalTo(make.height).multipliedBy(618 / 709);
        make.width.mas_equalTo(300);
    }];
}

- (void)goToShopCart
{
    
}

@end
