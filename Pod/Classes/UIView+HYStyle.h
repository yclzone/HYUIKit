//
//  UIView+HYStyle.h
//  Pods
//
//  Created by YCLZONE on 2/17/16.
//
//

#import <UIKit/UIKit.h>

@interface UIView (HYStyle)

#pragma mark - 圆角

/** 圆角 */
@property (nonatomic, assign) IBInspectable CGFloat hy_cornerRadius;


/**
 *  设置圆角
 *
 *  @param cornerRadius 圆角半径
 */
- (void)hy_setupCornerRadius:(CGFloat)cornerRadius;

/**
 *  圆形视图
 */
- (void)hy_setupCircleView;


/**
 *  设置局部圆角（如果同时设置了边框，边框没有圆角效果）
 *
 *  @param cornerRadius 圆角半径
 *  @param corners      指定的角
 */
- (void)hy_setupCornerRadius:(CGFloat)cornerRadius
           byRoundingCorners:(UIRectCorner)corners;

/**
 *  设置底部圆角
 *
 *  @param cornerRadius 圆角半径
 */
- (void)hy_setupBottomCornerRadius:(CGFloat)cornerRadius;

/**
 *  设置顶部圆角
 *
 *  @param cornerRadius 圆角半径
 */
- (void)hy_setupTopCornerRadius:(CGFloat)cornerRadius;

#pragma mark - 边框

/** 边框颜色 */
@property (nonatomic, strong) IBInspectable UIColor *hy_borderColor;
/** 边框宽度 */
@property (nonatomic, assign) IBInspectable CGFloat hy_borderWidth;

/**
 *  设置边框颜色、高度
 *
 *  @param color       边框颜色
 *  @param borderWidth 边框宽度
 */
- (void)hy_setupBorderColor:(UIColor *)color
                borderWidth:(CGFloat)borderWidth;
@end
