//
//  YGOrderViewController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/6/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGOrderViewController.h"
#import "YGTitleButtonsView.h"
#import "YGOrderCell.h"

@interface YGOrderViewController ()<YGtitleButtonsViewDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (weak, nonatomic) UITableView *allTableView;

@property (weak, nonatomic) UITableView *t4PayView;

@property (weak, nonatomic) UITableView *t4DeliveryView;

@property (weak, nonatomic) UITableView *t4TakeView;

@property (weak, nonatomic) UITableView *t4CommentView;

@property (weak, nonatomic) YGTitleButtonsView *titleView;

@property (weak, nonatomic) UIScrollView *scrollView;

@end

@implementation YGOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"訂單";
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = colorWithRGBA(230, 95, 45, 1.0);
    
    [self setupOrderView];
    
    [self setupTableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)setupOrderView
{
    YGTitleButtonsView *order = [[YGTitleButtonsView alloc] init];
    order.delegate = self;
    order.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:order];
    self.titleView = order;
    [order mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(70);
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
    }];
}

- (void)setupTableView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake((kMainScreenW - 30), (kMainScreenH - 75));
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).offset(5);
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    UITableView *allTableView = [self createTableView];
    self.allTableView = allTableView;
    [self.allTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.equalTo(self.scrollView);
        make.size.mas_equalTo(CGSizeMake((kMainScreenW - 30), (kMainScreenH - 75)));
    }];
    
    UITableView *t4PayView = [self createTableView];
    self.t4PayView = t4PayView;
    [self.t4PayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(allTableView);
        make.leading.equalTo(allTableView.mas_trailing);
        make.size.equalTo(allTableView);
    }];
    
    UITableView *t4DeliveryView = [self createTableView];
    self.t4DeliveryView = t4DeliveryView;
    [self.t4DeliveryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(allTableView);
        make.leading.equalTo(t4PayView.mas_trailing);
        make.size.equalTo(allTableView);
    }];
    
    UITableView *t4TakeView = [self createTableView];
    self.t4TakeView = t4TakeView;
    [self.t4TakeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(allTableView);
        make.leading.equalTo(t4DeliveryView.mas_trailing);
        make.size.equalTo(allTableView);
    }];
    
    UITableView *t4CommentView = [self createTableView];
    self.t4CommentView = t4CommentView;
    [self.t4CommentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(allTableView);
        make.leading.equalTo(t4TakeView.mas_trailing);
        make.trailing.equalTo(scrollView.mas_trailing);
        make.size.equalTo(allTableView);
    }];
    
}

- (UITableView *)createTableView
{
    UITableView *name = [[UITableView alloc] init];
    name.backgroundColor = [UIColor clearColor];
    name.separatorStyle = UITableViewCellSeparatorStyleNone;
    name.dataSource = self;
    name.delegate = self;
    [self.scrollView addSubview:name];
    name.estimatedRowHeight = 280;
    name.rowHeight = UITableViewAutomaticDimension;
//    name.rowHeight = 252;
    [name registerClass:[YGOrderCell class] forCellReuseIdentifier:@"allCell"];
    return name;
}

- (void)orientationDidChange:(NSNotification *)note
{
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    UIInterfaceOrientation interfaceorientation = (UIInterfaceOrientation)orientation;
    switch (interfaceorientation) {
        case UIInterfaceOrientationPortrait: {
            NSLog(@"-- 竖屏 ---");
            [self remakeConstraints];
        }
            break;
        case UIInterfaceOrientationLandscapeLeft: {
            NSLog(@"-- 横屏左 ---");
            [self remakeConstraints];
        }
            break;
        case UIInterfaceOrientationLandscapeRight: {
            NSLog(@"-- 竖横屏右 ---");
            [self remakeConstraints];
        }
            break;
        default:
            [self remakeConstraints];
            break;
    }
    
}

// remake all tableViews contraints
- (void)remakeConstraints
{
    self.scrollView.contentSize = CGSizeMake((kMainScreenW - 30), (kMainScreenH - 75));
    [self.allTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.equalTo(self.scrollView);
        make.size.mas_equalTo(CGSizeMake((kMainScreenW - 30), (kMainScreenH - 75)));
    }];
    
    [self.t4PayView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allTableView);
        make.leading.equalTo(self.allTableView.mas_trailing);
        make.size.equalTo(self.allTableView);
    }];
    
    [self.t4DeliveryView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allTableView);
        make.leading.equalTo(self.t4PayView.mas_trailing);
        make.size.equalTo(self.allTableView);
    }];
    
    [self.t4TakeView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allTableView);
        make.leading.equalTo(self.t4DeliveryView.mas_trailing);
        make.size.equalTo(self.allTableView);
    }];
    
    [self.t4CommentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allTableView);
        make.leading.equalTo(self.t4TakeView.mas_trailing);
        make.trailing.equalTo(self.scrollView.mas_trailing);
        make.size.equalTo(self.allTableView);
    }];
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - YGtitleButtonsViewDelegate
- (void)titleBtnsDidClick:(UIButton *)button
{
    // scroll to right tableView
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = button.tag * self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:offset animated:YES];
    
    if (0 == button.tag) { // all
        
    } else if (1 == button.tag) { // wait for pay
        
    } else if (2 == button.tag) { // wait for delivery
        
    } else if (3 == button.tag) { // wait to take deliver
        
    } else { // wait to take a comment
        
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.allTableView) { // all
        return 1;
    } else if (tableView == self.t4PayView) { // wait for pay
        return 1;
    } else if (tableView == self.t4DeliveryView) { // wait for delivery
        return 1;
    } else if (tableView == self.t4TakeView) { // wait to take deliver
        return 1;
    } else { // wait to take a comment
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"allCell" forIndexPath:indexPath];
    if (tableView == self.allTableView) { // all
        return cell;
    } else if (tableView == self.t4PayView) { // wait for pay
        return cell;
    } else if (tableView == self.t4DeliveryView) { // wait for delivery
        return cell;
    } else if (tableView == self.t4TakeView) { // wait to take deliver
        return cell;
    } else { // wait to take a comment
        return cell;
    }
}

#pragma amrk - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // set title button style
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    UIButton *selctedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selctedBtn.tag = index;
    [self.titleView setSelectButtonStyle:selctedBtn];
}

#pragma mark - dealloc
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
