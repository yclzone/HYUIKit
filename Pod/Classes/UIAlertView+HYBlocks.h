//
//  UIAlertView+HYBlocks.h
//  Pods
//
//  Created by YCLZONE on 2/18/16.
//
//

#import <UIKit/UIKit.h>

typedef void(^HYAlertViewClickButtonHandler)(UIAlertView *alertView, NSInteger buttonIndex);
typedef void(^HYAlertViewDismissHandler)(UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView (HYBlocks)

/** 点击回调 */
@property (nonatomic, copy) HYAlertViewClickButtonHandler hy_buttonsClickedHandler;

/** 消失回调 */
@property (nonatomic, copy) HYAlertViewDismissHandler hy_dismissHandler;

- (void)setHy_buttonsClickedHandler:(HYAlertViewClickButtonHandler)hy_buttonsClickedHandler;
- (void)setHy_dismissHandler:(HYAlertViewDismissHandler)hy_dismissHandler;


- (void)hy_showWithButtonsClickHandler:(HYAlertViewClickButtonHandler)handler;

- (void)hy_showWithDismissHandler:(HYAlertViewDismissHandler)handler;

@end
