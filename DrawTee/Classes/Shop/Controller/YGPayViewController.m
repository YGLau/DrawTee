//
//  YGPayViewController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/8/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGPayViewController.h"
#import "YGBottomPayView.h"
#import "YGAddressCell.h"
#import "YGOrderDetailCell.h"
#import "YGPayMethodCell.h"

@interface YGPayViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation YGPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = colorWithRGBA(128, 188, 55, 1.0);
    self.title = @"結賬";
    
    [self setupTableView];
    
    [self setupBottomView];
    
}

- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.automaticallyAdjustsScrollViewInsets = NO;
    tableView.backgroundColor = [UIColor randomColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
//    tableView.rowHeight = 180;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(70);
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [tableView registerClass:[YGAddressCell class] forCellReuseIdentifier:@"addrCell"];
    [tableView registerClass:[YGOrderDetailCell class] forCellReuseIdentifier:@"orderCell"];
    [tableView registerClass:[YGPayMethodCell class] forCellReuseIdentifier:@"payCell"];
}

- (void)setupBottomView
{
    YGBottomPayView *bottomPay = [[YGBottomPayView alloc] initWithImage:[UIImage imageNamed:@"border"]];
    //    bottomPay.backgroundColor = [UIColor randomColor];
    bottomPay.title = @"$110（包含運費）";
    bottomPay.buttonTitle = @"確認付款";
    __weak typeof(self) weakSelf = self;
    bottomPay.payBlock = ^ {
    };
    [self.view addSubview:bottomPay];
    [bottomPay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(150);
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        YGAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addrCell" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 1) {
        YGOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell" forIndexPath:indexPath];
        return cell;
    } else {
        YGPayMethodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"payCell" forIndexPath:indexPath];
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 80;
    } else if (indexPath.row == 1) {
        return 260;
    } else {
        return 180;
    }
}


@end
