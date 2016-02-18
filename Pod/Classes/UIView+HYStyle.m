//
//  UIView+HYStyle.m
//  Pods
//
//  Created by YCLZONE on 2/17/16.
//
//

#import "UIView+HYStyle.h"

@implementation UIView (HYStyle)
#pragma mark - 圆角

- (CGFloat)hy_cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setHy_cornerRadius:(CGFloat)hy_cornerRadius {
    [self hy_setupCornerRadius:hy_cornerRadius];
}

- (void)hy_setupCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)hy_setupCircleView {
    [self hy_setupCornerRadius:self.bounds.size.height*0.5];
}

- (void)hy_setupCornerRadius:(CGFloat)cornerRadius
           byRoundingCorners:(UIRectCorner)corners {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)hy_setupBottomCornerRadius:(CGFloat)cornerRadius {
    [self hy_setupCornerRadius:cornerRadius
             byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight];
}

- (void)hy_setupTopCornerRadius:(CGFloat)cornerRadius {
    [self hy_setupCornerRadius:cornerRadius
             byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight];
}

#pragma mark - 边框
- (UIColor *)hy_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setHy_borderColor:(UIColor *)hy_borderColor {
    self.layer.borderColor = hy_borderColor.CGColor;
}

- (CGFloat)hy_borderWidth {
    return self.layer.borderWidth;
}

- (void)setHy_borderWidth:(CGFloat)hy_borderWidth {
    self.layer.borderWidth = hy_borderWidth;
}

- (void)hy_setupBorderColor:(UIColor *)color
                borderWidth:(CGFloat)borderWidth {
    self.hy_borderColor = color;
    self.hy_borderWidth = borderWidth;
}




@end
