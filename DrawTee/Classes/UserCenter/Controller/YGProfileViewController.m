//
//  YGProfileViewController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/3/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGProfileViewController.h"
#import "YGHeadView.h"
#import "YGUserCenterView.h"
#import "YGMyOrderView.h"
#import "YGLoginController.h"
#import "YGSettingsViewController.h"
#import "YGOrderViewController.h"

@interface YGProfileViewController ()<userCenterViewDelegate>

@property (weak, nonatomic) UIImageView *headerImage;

@property (weak, nonatomic) YGHeadView *headView;

@property (weak, nonatomic) YGUserCenterView *userCenter;

@end

@implementation YGProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = colorWithRGBA(227, 84, 40, 1.0);
    
    UIImageView *headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_head"]];
    [self.view addSubview:headerImage];
    self.headerImage = headerImage;
    [headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(80);
    }];
    
    [self setupHeadView];
    
    [self setupUserCenterView];
    
    [self setupOrderView];
    
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
    [self.headView updateConstraints];
    [self.userCenter updateConstraints];

}

- (void)setupHeadView
{
    YGHeadView *headerView = [[YGHeadView alloc] initSubViewsWithTitle:@"用戶中心" leftBarbButtonImageName:@"setting" rightImageName:@"message"];
    headerView.btnBlock = ^(UIButton *btn) {
        YGSettingsViewController *settingVc = [[YGSettingsViewController alloc] init];
        [self.navigationController pushViewController:settingVc animated:YES];
    };
    //    headerView.backgroundColor = [UIColor randomColor];
    [self.view addSubview:headerView];
    self.headView = headerView;
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImage.mas_bottom);
        make.leading.equalTo(self.view.mas_leading).offset(20);
        make.trailing.equalTo(self.view.mas_trailing).offset(-20);
        make.height.mas_equalTo(40);
    }];
}

- (void)setupUserCenterView
{
    YGUserCenterView *userCenter = [[YGUserCenterView alloc] init];
    userCenter.delegate = self;
    __weak typeof(self) weakSelf = self;
    userCenter.tapBlock = ^() {
        UIAlertController *switchSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [switchSheet addAction:[UIAlertAction actionWithTitle:@"退出登錄" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [switchSheet addAction:[UIAlertAction actionWithTitle:@"切換賬號" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            YGLoginController *loginVc = [[YGLoginController alloc] init];
            [self presentViewController:loginVc animated:YES completion:nil];
        }]];
        [switchSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        if (kMainScreenW == 768 || kMainScreenW == 1024) { // iPad
            UIPopoverPresentationController *popover = [switchSheet popoverPresentationController];
            popover.sourceView = weakSelf.userCenter.iconImage;
            popover.sourceRect = CGRectMake(-140, -220, 200, 500);
            [switchSheet setModalPresentationStyle:UIModalPresentationPopover];
        }
        [weakSelf presentViewController:switchSheet animated:YES completion:nil];
    };
    userCenter.backgroundColor = [UIColor clearColor];
    [self.view addSubview:userCenter];
    self.userCenter = userCenter;
    [userCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.top.equalTo(self.headView.mas_bottom).offset(70);
        make.height.mas_equalTo(180);
    }];
}

- (void)setupOrderView
{
    YGMyOrderView *myOrderView = [[YGMyOrderView alloc] init];
    myOrderView.layer.cornerRadius = 10;
    myOrderView.layer.masksToBounds = YES;
    myOrderView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myOrderView];
    [myOrderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userCenter.mas_bottom).offset(5);
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
}

#pragma mark - userCenterViewDelegate
- (void)userCenterBtnsDidClick:(UIButton *)button
{
    if (0 == button.tag) { // add btn
        
    } else if (1 == button.tag) { // wait Pay
        YGOrderViewController *orderVc = [[YGOrderViewController alloc] init];
        [self.navigationController pushViewController:orderVc animated:YES];
    } else if (2 == button.tag) { // wait delivery
        YGOrderViewController *orderVc = [[YGOrderViewController alloc] init];
        [self.navigationController pushViewController:orderVc animated:YES];
    } else { // wait to take deliver
        YGOrderViewController *orderVc = [[YGOrderViewController alloc] init];
        [self.navigationController pushViewController:orderVc animated:YES];
    }
}

#pragma mark - dealloc
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
