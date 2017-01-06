//
//  YGLoginDashBoard.h
//  DrawTee
//
//  Created by 刘勇刚 on 12/5/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol loginDashBoardDelegate <NSObject>

@optional
- (void)dashBoardBtnDidClick:(UIButton *)button;

@end

@interface YGLoginDashBoard : UIView

@property (weak, nonatomic) id<loginDashBoardDelegate> delegate;

@end
