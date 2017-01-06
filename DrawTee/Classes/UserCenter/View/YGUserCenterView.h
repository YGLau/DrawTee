//
//  YGUserCenterView.h
//  DrawTee
//
//  Created by 刘勇刚 on 12/4/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^userCenterIconTapBlock) ();

@protocol userCenterViewDelegate <NSObject>

@optional
- (void)userCenterBtnsDidClick:(UIButton *)button;

@end

@interface YGUserCenterView : UIView
/**
 tap icon callback block
 */
@property (copy, nonatomic) userCenterIconTapBlock tapBlock;

@property (weak, nonatomic, readonly) UIImageView *iconImage;

@property (weak, nonatomic) id<userCenterViewDelegate> delegate;

@end
