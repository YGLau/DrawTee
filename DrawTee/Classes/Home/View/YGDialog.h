//
//  YGDialog.h
//  DrawTee
//
//  Created by 刘勇刚 on 12/3/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - SMPaymentButton class
@interface SMPaymentButton : UIButton

@end

@protocol YGDialogDelegate <NSObject>

@optional
- (void)dialogCloseBtnDidClick;
- (void)dialogconfirmButtonDidClick;
- (void)dialogpicAndCamBtnClick:(SMPaymentButton *)button;

@end

@interface YGDialog : UIView

@property (weak, nonatomic) id<YGDialogDelegate> delegate;

/**
 *  创建一个文字弹框
 */
- (instancetype)initWithTitleImageName:(NSString *)imageName content:(NSString *)contentText delegate:(id)delegate;
/**
 *  创建一个支付窗口弹框
 */
- (instancetype)initContentButtonsWithDelegate:(id)delegate;

@end


