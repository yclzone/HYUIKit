//
//  UIView+HYFrame.h
//  Pods
//
//  Created by YCLZONE on 2/17/16.
//
//

#import <UIKit/UIKit.h>

@interface UIView (HYFrame)
/** frame X */
@property (nonatomic, assign) CGFloat hy_x;
/** frame Y */
@property (nonatomic, assign) CGFloat hy_y;
/** frame width */
@property (nonatomic, assign) CGFloat hy_width;
/** frame height */
@property (nonatomic, assign) CGFloat hy_height;
/** center X */
@property (nonatomic, assign) CGFloat hy_centerX;
/** center Y */
@property (nonatomic, assign) CGFloat hy_centerY;
@end
