//
//  YGSettingsViewController.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/5/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import "YGSettingsViewController.h"
#import "YGSettingsCell.h"
#import "YGAddrManageController.h"

@interface YGSettingsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UIButton *logoutBtn;
@property (weak, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *cellTitleArr;

@end

@implementation YGSettingsViewController

- (NSArray *)cellTitleArr
{
    if (!_cellTitleArr) {
        _cellTitleArr = @[@"修改密碼", @"收貨地址管理", @"清理緩存", @"關於我們", @"意見反饋"];
    }
    return _cellTitleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"設置中心";
    
    UITableView *settings = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.automaticallyAdjustsScrollViewInsets = NO;
    settings.separatorStyle = UITableViewCellSeparatorStyleNone;
    settings.rowHeight = 60;
    settings.backgroundColor = [UIColor whiteColor];
    settings.delegate = self;
    settings.dataSource = self;
    [self.view addSubview:settings];
    self.tableView = settings;
    [settings mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.leading.equalTo(self.view.mas_leading).offset(20);
        make.trailing.equalTo(self.view.mas_trailing).offset(-20);
    }];
    [settings registerClass:[YGSettingsCell class] forCellReuseIdentifier:@"settingsCell"];
    
    UIButton *logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    logoutBtn.layer.cornerRadius = 30;
    logoutBtn.layer.masksToBounds = YES;
    [logoutBtn setTitle:@"登出" forState:UIControlStateNormal];
    logoutBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    logoutBtn.backgroundColor = colorWithRGBA(249, 196, 6, 1.0);
    [self.view addSubview:logoutBtn];
    self.logoutBtn = logoutBtn;
    [logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(settings.mas_bottom);
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(kMainScreenW == 320 ? 280 : 300);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationChange
{
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 2 : 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingsCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        [cell setTitle:self.cellTitleArr[indexPath.row]];
        if (indexPath.row == 1) {
            [cell removeSeparatorLine];
        }
        return cell;
    } else {
        [cell setTitle:self.cellTitleArr[indexPath.row + 2]];
        if (indexPath.row == 2) {
            [cell removeSeparatorLine];
        }
        return cell;
    }
}

/**
 * 将要为每行row绘制cell，可自定义cell显示方法
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(tintColor)]) {
        if (tableView == self.tableView) {
            // 圆角弧度半径
            CGFloat cornerRadius = 8.f;
            // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
            cell.backgroundColor = [UIColor clearColor];
            
            // 创建一个shapeLayer
            CAShapeLayer *layer = [[CAShapeLayer alloc] init];
            // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
            CGMutablePathRef pathRef = CGPathCreateMutable();
            // 获取cell的size
            CGRect bounds = CGRectInset(cell.bounds, 0, 0);
            
            // CGRectGetMinY：返回对象顶点坐标
            // CGRectGetMaxY：返回对象底点坐标
            // CGRectGetMinX：返回对象左边缘坐标
            // CGRectGetMaxX：返回对象右边缘坐标
            
            // 这里要判断分组列表中的第一行，每组section的第一行，每组section的中间行
            BOOL addLine = NO;
            // CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
            if (indexPath.row == 0) {
                // 初始起点为cell的左下角坐标
                CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
                // 起始坐标为左下角，设为p1，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
                // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
                CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
                addLine = YES;
            } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
                // 初始起点为cell的左上角坐标
                CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
                // 添加一条直线，终点坐标为右下角坐标点并放到路径中去
                CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
            } else {
                // 添加cell的rectangle信息到path中（不包括圆角）
                CGPathAddRect(pathRef, nil, bounds);
                addLine = YES;
            }
            // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
            layer.path = pathRef;
            // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
            CFRelease(pathRef);
            // 按照shape layer的path填充颜色，类似于渲染render
            layer.fillColor = [[UIColor blackColor] colorWithAlphaComponent:0.07].CGColor;
            // 添加分隔线图层
            if (addLine == YES) {
                CALayer *lineLayer = [[CALayer alloc] init];
                CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
                lineLayer.frame = CGRectMake(CGRectGetMinX(bounds), bounds.size.height-lineHeight, bounds.size.width, lineHeight);
                // 分隔线颜色取自于原来tableview的分隔线颜色
                lineLayer.backgroundColor = tableView.separatorColor.CGColor;
                [layer addSublayer:lineLayer];
            }
            
            // view大小与cell一致
            UIView *roundView = [[UIView alloc] initWithFrame:bounds];
            // 添加自定义圆角后的图层到roundView中
            [roundView.layer insertSublayer:layer atIndex:0];
            roundView.backgroundColor = [UIColor clearColor];
            //cell的背景view
            //cell.selectedBackgroundView = roundView;
            cell.backgroundView = roundView;
            
        }
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
        } else {
            YGAddrManageController *addrVc = [[YGAddrManageController alloc] init];
            [self.navigationController pushViewController:addrVc animated:YES];
        }
    } else {
        
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
