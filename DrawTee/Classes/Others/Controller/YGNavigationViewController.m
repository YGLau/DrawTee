//
//  YGNavigationViewController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/3/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGNavigationViewController.h"

@interface YGNavigationViewController ()

@end

@implementation YGNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(0, 0, 50, 30);
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        [backBtn addTarget:self action:@selector(closeViewController) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)closeViewController
{
    [self popViewControllerAnimated:YES];
}


@end
