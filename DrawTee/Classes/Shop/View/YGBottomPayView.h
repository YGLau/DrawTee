//
//  YGBottomPayView.h
//  DrawTee
//
//  Created by 刘勇刚 on 12/8/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^bottomPayButtonBlock) ();

@interface YGBottomPayView : UIImageView

@property (copy, nonatomic) bottomPayButtonBlock payBlock;

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *buttonTitle;

@end
