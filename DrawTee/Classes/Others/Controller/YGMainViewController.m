//
//  YGMainViewController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/3/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGMainViewController.h"
#import "YGNavigationViewController.h"
#import "YGShopViewController.h"
#import "YGHomeViewController.h"
#import "YGProfileViewController.h"
#import "YGTabBar.h"
#import "Masonry.h"

@interface YGMainViewController ()<YGTabBarDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) UIView *tabBar;
@end

@implementation YGMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    YGNavigationViewController *homeVc = [[YGNavigationViewController alloc] initWithRootViewController:[[YGHomeViewController alloc] init]];
    homeVc.delegate = self;
    [self addChildViewController:homeVc];
    [self.view addSubview:homeVc.view];
    [homeVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    YGNavigationViewController *shopVc = [[YGNavigationViewController alloc] initWithRootViewController:[[YGShopViewController alloc] init]];
    shopVc.delegate = self;
    [self addChildViewController:shopVc];
    shopVc.view.hidden = YES;
    [self.view addSubview:shopVc.view];
    [shopVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    YGNavigationViewController *profileVc = [[YGNavigationViewController alloc] initWithRootViewController:[[YGProfileViewController alloc] init]];
    profileVc.delegate = self;
    [self addChildViewController:profileVc];
    [self.view addSubview:profileVc.view];
    profileVc.view.hidden = YES;
    [shopVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // add tabBar
    YGTabBar *tabBar = [[YGTabBar alloc] init];
    tabBar.delegate = self;
    tabBar.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    tabBar.layer.cornerRadius = 25;
    tabBar.layer.masksToBounds = YES;
    [self.view addSubview:tabBar];
    self.tabBar = tabBar;
    [tabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(120);
        make.leading.equalTo(self.view.mas_leading).offset(50);
        make.trailing.equalTo(self.view.mas_trailing).offset(-50);
        make.height.mas_equalTo(50);
    }];
    
}

- (void)setTabBarHidden:(BOOL)hide
{
    self.tabBar.hidden = hide ? YES : NO;
}

#pragma mark - YGTabBarDelegate
- (void)tabBarButtonDidClick:(UIButton *)selBtn
{
    YGHomeViewController *homeVc = self.childViewControllers[0];
    YGShopViewController *shopVc = self.childViewControllers[1];
    YGProfileViewController *profileVc = self.childViewControllers[2];
    if (selBtn.tag == 1) { // homebtn
        shopVc.view.hidden = YES;
        profileVc.view.hidden = YES;
        homeVc.view.hidden = NO;
    } else if (selBtn.tag == 2) { // shopbtn
        homeVc.view.hidden = YES;
        profileVc.view.hidden = YES;
        shopVc.view.hidden = NO;
    } else { // profileBtn
        homeVc.view.hidden = YES;
        shopVc.view.hidden = YES;
        profileVc.view.hidden = NO;
    }
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isKindOfClass:[YGHomeViewController class]] || [viewController isKindOfClass:[YGShopViewController class]] || [viewController isKindOfClass:[YGProfileViewController class]]) {
        [self setTabBarHidden:NO];
    } else {
        [self setTabBarHidden:YES];
    }
}

@end
