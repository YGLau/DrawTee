//
//  YGShopViewController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/3/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGShopViewController.h"
#import "YGHeadView.h"
#import "YGBottomPayView.h"
#import "YGGoodCell.h"
#import "YGPayViewController.h"

@interface YGShopViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UIImageView *headerImage;

@property (weak, nonatomic) YGHeadView *headView;

@property (weak, nonatomic) UITableView *goodList;

@property (weak, nonatomic) YGBottomPayView *bottomPay;

@end

@implementation YGShopViewController
#pragma mark - views methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = colorWithRGBA(144, 198, 70, 1.0);
    
    [self setupHeaderImage];
    
    [self setupHeadView];
    
    [self setupGoodList];
    
    [self setupBottomView];
    
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
    [self.goodList updateConstraints];
    [self.bottomPay updateConstraints];

}

#pragma mark - create subviews
- (void)setupHeaderImage
{
    UIImageView *headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"border"]];
    [self.view addSubview:headerImage];
    self.headerImage = headerImage;
    headerImage.transform = CGAffineTransformMakeRotation(M_PI);
    [headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(80);
    }];
}

- (void)setupHeadView
{
    YGHeadView *headView = [[YGHeadView alloc] initSubViewsWithTitle:@"購物車" leftBarbButtonImageName:@"back" rightImageName:@"icon_edit"];
    [self.view addSubview:headView];
    self.headView = headView;
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImage.mas_bottom);
        make.leading.equalTo(self.view.mas_leading).offset(20);
        make.trailing.equalTo(self.view.mas_trailing).offset(-20);
        make.height.mas_equalTo(40);
    }];
}

- (void)setupGoodList
{
    UITableView *goodList = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    goodList.separatorStyle = UITableViewCellSeparatorStyleNone;
    goodList.backgroundColor = [UIColor clearColor];
    goodList.delegate = self;
    goodList.dataSource = self;
    goodList.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    goodList.rowHeight = 180;
    goodList.showsVerticalScrollIndicator = NO;
    [self.view addSubview:goodList];
    [goodList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headView.mas_bottom).offset(70);
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [goodList registerClass:[YGGoodCell class] forCellReuseIdentifier:@"goodCell"];
}

- (void)setupBottomView
{
    YGBottomPayView *bottomPay = [[YGBottomPayView alloc] initWithImage:[UIImage imageNamed:@"border"]];
    //    bottomPay.backgroundColor = [UIColor randomColor];
    __weak typeof(self) weakSelf = self;
    bottomPay.payBlock = ^ {
        YGPayViewController *payVc = [[YGPayViewController alloc] init];
        [weakSelf.navigationController pushViewController:payVc animated:YES];
    };
    [self.view addSubview:bottomPay];
    self.bottomPay = bottomPay;
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
    YGGoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goodCell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

#pragma mark - dealloc
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
