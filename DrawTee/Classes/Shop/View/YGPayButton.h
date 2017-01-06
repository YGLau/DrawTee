//
//  YGPayButton.h
//  DrawTee
//
//  Created by 刘勇刚 on 12/8/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    payButtonSelected,
    payButtonNormal,
} PayButtonState;

@interface YGPayButton : UIButton

@property (assign, nonatomic) PayButtonState buttonState;

- (void)setImageFlagWithButtonState:(PayButtonState)state;

@end
