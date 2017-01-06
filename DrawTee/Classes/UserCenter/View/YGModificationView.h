//
//  YGModificationView.h
//  DrawTee
//
//  Created by 刘勇刚 on 12/6/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    modificationViewAdd, // add a new
    ModificationViewEdit, // edit current
} modificationViewType;

@interface YGModificationView : UIView

@property (assign, nonatomic) modificationViewType viewType;

@end
