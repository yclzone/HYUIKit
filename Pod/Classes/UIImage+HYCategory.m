//
//  UIImage+Scale.m
//  NewSuperGym
//
//  Created by liliang on 15/7/9.
//  Copyright (c) 2015年 hanyou. All rights reserved.
//

#import "UIImage+HYCategory.h"

@implementation UIImage (HYCategory)

- (UIImage *)scaleImageToSize:(CGSize)imageSize {
    UIGraphicsBeginImageContext(imageSize);
    
    [self drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (UIImage *)scaleImageToMaxWidthOrHeight:(CGFloat)imageWdithOrHeight {
    CGSize size = self.size;
    UIImage *newImage;
    if (size.width > size.height) {
        if (size.width >= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.width;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
        else if (size.height >= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.height;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
        else {
            newImage = self;
        }
    }
    else {
        if (size.height >= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.height;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
        else if (size.width >= imageWdithOrHeight) {
            float scale = imageWdithOrHeight / size.width;
            CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
            newImage = [self scaleImageToSize:newSize];
        }
        else {
            newImage = self;
        }
    }
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color withFrame:(CGRect)rect{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


/*
 http://liumh.com/2015/06/14/ios-create-gradient-backgroundcolor/
 */
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case GradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        case GradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
        case GradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
        case GradientTypeUprightToLowleft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

@end
