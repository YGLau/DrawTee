//
//  YGDialog.m
//  DrawTee
//
//  Created by 刘勇刚 on 12/3/16.
//  Copyright © 2016 ResPcherSJ. All rights reserved.
//

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "YGDialog.h"
#import "Masonry.h"

@interface YGDialog ()
/** 大背景图片 */
@property (weak, nonatomic) UIView *bgView;
/** 关闭按钮 */
@property (weak, nonatomic) UIButton *closebutton;

@property (weak, nonatomic) UILabel *contentLabel;

@property (weak, nonatomic) UIButton *confirmButton;

@property (weak, nonatomic) UIImageView *imageView;

@end

#pragma - mark - SMPaymentButton Implementation
@implementation SMPaymentButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.width);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat y = CGRectGetMaxY(self.imageView.frame);
    return CGRectMake(0, y, contentRect.size.width, 30);
}

@end

#pragma - mark - YGDialog Implementation
@implementation YGDialog

#pragma mark - public methods
- (instancetype)initWithTitleImageName:(NSString *)imageName content:(NSString *)contentText delegate:(id)delegate
{
    if (self = [super initWithFrame:CGRectZero]) {
        [self addDashBoardView];
        [self addHeaderImageWithImageName:imageName];
        [self addContentLabelWithText:contentText];
        [self addConfirmButton];
        self.delegate = delegate;
    }
    return self;
}
- (instancetype)initContentButtonsWithDelegate:(id)delegate
{
    if (self = [super initWithFrame:CGRectZero]) {
        [self addDashBoardView];
        [self addCloseButton];
        [self addBtns];
        self.delegate = delegate;
    }
    return self;
}

#pragma mark - 添加子控件
- (void)addDashBoardView
{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 15;
    bgView.layer.masksToBounds = YES;
    [self addSubview:bgView];
    self.bgView = bgView;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(50);
        make.leading.trailing.bottom.equalTo(self);
    }];
    
}
- (void)addHeaderImageWithImageName:(NSString *)imageName
{
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [self addSubview:image];
    self.imageView = image;
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView.mas_centerX);
        make.centerY.equalTo(self.bgView.mas_top);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}
/**  添加关闭按钮 */
- (void)addCloseButton
{
    UIButton *closeBtn = [self createButtonWithClass:[UIButton class] Title:nil image:@"del" backgroundColor:nil action:@selector(closeBtnClick)];
    [self addSubview:closeBtn];
    self.closebutton = closeBtn;
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.mas_trailing).offset(5);
        make.top.equalTo(self.bgView.mas_top).offset(-10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
}

- (void)addBtns
{
    SMPaymentButton *picBtn = (SMPaymentButton *)[self createButtonWithClass:[SMPaymentButton class] Title:@"圖片" image:@"pat" backgroundColor:nil action:@selector(picAndCamBtnClick:)];
    picBtn.tag = 1;
    [self.bgView addSubview:picBtn];
//    picBtn.titleLabel.backgroundColor = [UIColor randomColor];
    [picBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(30);
        make.size.mas_equalTo(CGSizeMake(100, 130));
        make.centerY.equalTo(self.bgView.mas_centerY);
        make.leading.equalTo(self.bgView.mas_leading).offset(30);
        make.bottom.bottom.equalTo(self.bgView.mas_bottom).offset(-30);
    }];
    
    SMPaymentButton *camBtn = (SMPaymentButton *)[self createButtonWithClass:[SMPaymentButton class] Title:@"相機" image:@"photo" backgroundColor:nil action:@selector(picAndCamBtnClick:)];
    [self.bgView addSubview:camBtn];
    camBtn.tag = 2;
    [camBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [camBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(picBtn.mas_centerY);
        make.size.equalTo(picBtn);
        make.trailing.equalTo(self.bgView.mas_trailing).offset(-30);
    }];
}

- (void)addContentLabelWithText:(NSString *)text
{
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:17.0];
    contentLabel.numberOfLines = 2;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.text = text;
//    contentLabel.backgroundColor = [UIColor randomColor];
    [self.bgView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.bgView.mas_leading).offset(25);
        make.trailing.equalTo(self.bgView.mas_trailing).offset(-25);
        make.top.equalTo(self.bgView.mas_top).offset(60);
        make.height.mas_equalTo(50);
    }];
}

- (void)addConfirmButton
{
     UIButton *btn= [self createButtonWithClass:[UIButton class] Title:@"確定" image:nil backgroundColor:colorWithRGBA(249, 196, 6, 1.0) action:@selector(cnfirmBtnClick)];
    self.confirmButton = btn;
    btn.layer.cornerRadius = 25;
    btn.layer.masksToBounds = YES;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(20);
        make.leading.equalTo(self.bgView.mas_leading).offset(20);
        make.trailing.equalTo(self.bgView.mas_trailing).offset(-20);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-25);
    }];
}

- (nullable UIButton *)createButtonWithClass:(Class)class Title:(nullable NSString *)title image:(nullable NSString *)imageName backgroundColor:(UIColor *)color action:(SEL)sel
{
    UIButton *button = [[class alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:button];
    button.backgroundColor = color ? color : [UIColor whiteColor];
    return button;
}


#pragma mark - 按钮点击方法
- (void)cnfirmBtnClick
{
    if ([self.delegate respondsToSelector:@selector(dialogconfirmButtonDidClick)]) {
        [self.delegate dialogconfirmButtonDidClick];
    }
}

- (void)picAndCamBtnClick:(SMPaymentButton *)button
{
    if ([self.delegate respondsToSelector:@selector(dialogpicAndCamBtnClick:)]) {
        [self.delegate dialogpicAndCamBtnClick:button];
    }
}
- (void)closeBtnClick
{
    if ([self.delegate respondsToSelector:@selector(dialogCloseBtnDidClick)]) {
        [self.delegate dialogCloseBtnDidClick];
    }
}

@end
