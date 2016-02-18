//
//  UIView+HYFrame.m
//  Pods
//
//  Created by YCLZONE on 2/17/16.
//
//

#import "UIView+HYFrame.h"

@implementation UIView (HYFrame)
- (void)setHy_height:(CGFloat)hy_height {
    CGRect frame = self.frame;
    frame.size.height = hy_height;
    self.frame = frame;
}
- (CGFloat)hy_height {
    return self.frame.size.height;
}

- (void)setHy_width:(CGFloat)hy_width {
    CGRect frame = self.frame;
    frame.size.width = hy_width;
    self.frame = frame;
}
- (CGFloat)hy_width {
    return self.frame.size.width;
}

- (void)setHy_x:(CGFloat)hy_x {
    CGRect frame = self.frame;
    frame.origin.x = hy_x;
    self.frame = frame;
}
- (CGFloat)hy_x {
    return self.frame.origin.x;
}

- (void)setHy_y:(CGFloat)hy_y {
    CGRect frame = self.frame;
    frame.origin.y = hy_y;
    self.frame = frame;
}
- (CGFloat)hy_y {
    return self.frame.origin.y;
}

- (void)setHy_centerX:(CGFloat)hy_centerX {
    CGPoint center = self.center;
    center.x = hy_centerX;
    self.center = center;
}
- (CGFloat)hy_centerX {
    return self.center.x;
}

- (void)setHy_centerY:(CGFloat)hy_centerY {
    CGPoint center = self.center;
    center.y = hy_centerY;
    self.center = center;
}
- (CGFloat)hy_centerY {
    return self.center.y;
}
@end
