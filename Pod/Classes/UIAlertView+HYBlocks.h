//
//  UIAlertView+HYBlocks.h
//  Pods
//
//  Created by YCLZONE on 2/18/16.
//
//

#import <UIKit/UIKit.h>

typedef void(^HYAlertViewClickButtonHandler)(UIAlertView *alertView, NSInteger index);

@interface UIAlertView (HYBlocks)

/** 点击回调 */
@property (nonatomic, copy) HYAlertViewClickButtonHandler hy_buttonsClickedHandler;

- (void)setHy_buttonsClickedHandler:(HYAlertViewClickButtonHandler)hy_buttonsClickedHandler;

- (void)hy_showWithButtonsClickHandler:(HYAlertViewClickButtonHandler)handler;

@end
