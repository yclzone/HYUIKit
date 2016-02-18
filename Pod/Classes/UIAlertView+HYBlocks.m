//
//  UIAlertView+HYBlocks.m
//  Pods
//
//  Created by YCLZONE on 2/18/16.
//
//

#import "UIAlertView+HYBlocks.h"
#import <objc/runtime.h>

static const void *HYAlertViewDelegateKey = &HYAlertViewDelegateKey;
static const void *HYAlertViewButtonsClickedHandlerKey = &HYAlertViewButtonsClickedHandlerKey;

@implementation UIAlertView (HYBlocks)


#pragma mark - Public Methods
- (void)setHy_buttonsClickedHandler:(HYAlertViewClickButtonHandler)hy_buttonsClickedHandler {
    [self setupDelegate];
    objc_setAssociatedObject(self, HYAlertViewButtonsClickedHandlerKey, hy_buttonsClickedHandler, OBJC_ASSOCIATION_COPY);
}

- (HYAlertViewClickButtonHandler)hy_buttonsClickedHandler {
    return objc_getAssociatedObject(self, HYAlertViewButtonsClickedHandlerKey);
}

- (void)hy_showWithButtonsClickHandler:(HYAlertViewClickButtonHandler)handler {
    self.hy_buttonsClickedHandler = handler;
    [self show];
}

#pragma mark - 设置代理
- (void)setupDelegate {
    
    id<UIAlertViewDelegate> selfDelegate = (id<UIAlertViewDelegate>) self;
    if (self.delegate != selfDelegate) {
        objc_setAssociatedObject(self, HYAlertViewDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = selfDelegate;
    }
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    HYAlertViewClickButtonHandler clickHandler = alertView.hy_buttonsClickedHandler;
    if (clickHandler) {
        clickHandler(alertView, buttonIndex);
    }
    
    id delegate = objc_getAssociatedObject(self, HYAlertViewDelegateKey);
    if ([delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
        [delegate alertView:alertView clickedButtonAtIndex:buttonIndex];
    }
}

@end
