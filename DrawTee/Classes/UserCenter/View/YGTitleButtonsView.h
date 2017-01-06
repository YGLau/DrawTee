//
//  YGTitleButtonsView.h
//  DrawTee
//
//  Created by 刘勇刚 on 12/6/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YGtitleButtonsViewDelegate <NSObject>

@optional
- (void)titleBtnsDidClick:(UIButton *)button;

@end

@interface YGTitleButtonsView : UIView

@property (weak, nonatomic) id<YGtitleButtonsViewDelegate> delegate;

- (void)setSelectButtonStyle:(UIButton *)selectedBtn;

@end
