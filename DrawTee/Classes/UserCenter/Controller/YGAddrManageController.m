//
//  YGAddrManageController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/6/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGAddrManageController.h"
#import "YGAddressViewCell.h"
#import "YGModificationAddrController.h"

@interface YGAddrManageController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView *tableView;

@end

@implementation YGAddrManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"地址管理";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 200;
    self.automaticallyAdjustsScrollViewInsets = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(70);
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
    }];
    [tableView registerClass:[YGAddressViewCell class] forCellReuseIdentifier:@"addrCell"];
    
    UIButton *addAddrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addAddrBtn.layer.cornerRadius = 5;
    addAddrBtn.layer.masksToBounds = YES;
    addAddrBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    addAddrBtn.backgroundColor = colorWithRGBA(242, 242, 242, 1.0);
    [self.view addSubview:addAddrBtn];
    [addAddrBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addAddrBtn setTitle:@"新增一個收穫地址" forState:UIControlStateNormal];
    [addAddrBtn setTitleColor:colorWithRGBA(97, 97, 97, 1.0) forState:UIControlStateNormal];
    [addAddrBtn addTarget:self action:@selector(addAdress) forControlEvents:UIControlEventTouchUpInside];
    addAddrBtn.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [addAddrBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tableView.mas_bottom);
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.height.mas_equalTo(60);
        make.bottom.equalTo(self.view.mas_bottom).offset(-80);
        
    }];
    
}

- (void)addAdress
{
    YGModificationAddrController *modVc = [[YGModificationAddrController alloc] init];
    modVc.addFlag = YES;
    [self.navigationController pushViewController:modVc animated:YES];
}

#pragma mark - UITableViewDelegate
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGAddressViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addrCell" forIndexPath:indexPath];
    __weak typeof(self) weakSelf = self;
    cell.editBliock = ^ {
        YGModificationAddrController *modVc = [[YGModificationAddrController alloc] init];
        modVc.addFlag = NO;
        [weakSelf.navigationController pushViewController:modVc animated:YES];
    };
    return cell;
}

@end
