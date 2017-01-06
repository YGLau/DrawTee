//
//  YGHomeViewController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/3/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGHomeViewController.h"
#import "YGTabBar.h"
#import "YGDialog.h"
#import "YGUploadController.h"

@interface YGHomeViewController ()<YGDialogDelegate>

@property (weak, nonatomic) YGDialog *dialog;

@property (weak, nonatomic) UIImageView *headerImage;

@property (weak, nonatomic) UIButton *printBtn;

@property (weak, nonatomic) UIButton *uploadBtn;
@end

@implementation YGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = colorWithRGBA(91, 217, 231, 1.0);
    
    UIImageView *headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_head"]];
//    headerImage.backgroundColor = [UIColor randomColor];
    [self.view addSubview:headerImage];
    self.headerImage = headerImage;
    [headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(80);
    }];
    
    UIButton *printBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    printBtn.tag = 1;
    [self.view addSubview:printBtn];
    self.printBtn = printBtn;
    [printBtn setImage:[UIImage imageNamed:@"icon_print"] forState:UIControlStateNormal];
    [printBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [printBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.mas_equalTo(208);
        make.top.equalTo(headerImage.mas_bottom).offset(100);
        make.trailing.equalTo(self.view.mas_trailing).offset(-50);
    }];
    
    UIButton *uploadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    uploadBtn.tag = 2;
    [self.view addSubview:uploadBtn];
    self.uploadBtn = uploadBtn;
    [uploadBtn setImage:[UIImage imageNamed:@"icon_upload"] forState:UIControlStateNormal];
    [uploadBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [uploadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(printBtn);
        make.top.equalTo(headerImage.mas_bottom).offset(280);
        make.leading.equalTo(self.view.mas_leading).offset(50);
    }];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)orientationChange
{
    [self.headerImage updateConstraints];
    [self.printBtn updateConstraints];
    [self.uploadBtn updateConstraints];

}

- (void)buttonClick:(UIButton *)clickBtn
{
//    NSLog(@"---");
    if (clickBtn.tag == 1) {
        YGUploadController *uploadVc = [[YGUploadController alloc] init];
        [self.navigationController pushViewController:uploadVc animated:YES];
//        YGDialog *dialog = [[YGDialog alloc] initWithTitleImageName:@"tips_yes" content:@"Tee模板已經保存在系統相冊，你可在相冊中查看并選擇列印。" delegate:self];
////        dialog.backgroundColor = [UIColor randomColor];
//        [self.view addSubview:dialog];
//        self.dialog = dialog;
//        [dialog mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.view.mas_centerX);
//            make.width.mas_equalTo(300);
//            make.centerY.equalTo(self.view.mas_centerY).offset(-30);
//        }];
        
//        YGDialog *dialog = [[YGDialog alloc] initWithTitleImageName:@"tips_no" content:@"無法找到有效的打印機設備請先安裝打印機" delegate:self];
////        dialog.backgroundColor = [UIColor randomColor];
//        [self.view addSubview:dialog];
//        self.dialog = dialog;
//        [dialog mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.view.mas_centerX);
//            make.width.mas_equalTo(300);
//            make.centerY.equalTo(self.view.mas_centerY).offset(-30);
//        }];
    } else {
        YGDialog *dialog = [[YGDialog alloc] initContentButtonsWithDelegate:self];
//        dialog.backgroundColor = [UIColor randomColor];
        [self.view addSubview:dialog];
        self.dialog = dialog;
        [dialog mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.mas_equalTo(300);
            make.centerY.equalTo(self.view.mas_centerY).offset(-30);
        }];
    }
}

#pragma mark - YGDialogDelegate
- (void)dialogCloseBtnDidClick
{
    [self.dialog removeFromSuperview];
}

- (void)dialogconfirmButtonDidClick
{
    [self.dialog removeFromSuperview];
}

#pragma mark - dealloc
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
