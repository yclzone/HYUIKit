//
//  UIImage+Scale.h
//  NewSuperGym
//
//  Created by liliang on 15/7/9.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到小
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};

@interface UIImage (HYCategory)

/**
 *  把图片缩小到指定尺寸
 *
 *  @param imageSize 制定图片的尺寸
 *
 *  @return 新的图片
 */
- (UIImage *)scaleImageToSize:(CGSize)imageSize;


/**
 *  把图片缩小到宽或高最大得长度
 *
 *  @param imageWdithOrHeight 图片的宽或高
 *
 *  @return 新图片
 */
- (UIImage *)scaleImageToMaxWidthOrHeight:(CGFloat)imageWdithOrHeight;



+ (UIImage *)imageWithColor:(UIColor *)color;


+ (UIImage *)imageWithColor:(UIColor *)color withFrame:(CGRect)rect;

+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;
@end
