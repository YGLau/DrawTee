//
//  YGHeadView.h
//  DrawTee
//
//  Created by 刘勇刚 on 12/4/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^headViewBtnBlock) (UIButton *);

@interface YGHeadView : UIView

@property (copy, nonatomic) headViewBtnBlock btnBlock;

- (instancetype)initSubViewsWithTitle:(NSString *)title leftBarbButtonImageName:(NSString *)leftImageName rightImageName:(NSString *)rightImageName;

- (void)setViewTitle:(NSString *)title;

@end
