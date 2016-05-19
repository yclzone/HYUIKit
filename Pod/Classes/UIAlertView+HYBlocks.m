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
static const void *HYAlertViewDismissHandlerKey = &HYAlertViewDismissHandlerKey;

@implementation UIAlertView (HYBlocks)

#pragma mark - Public Methods
- (void)hy_showWithButtonsClickHandler:(HYAlertViewClickButtonHandler)handler {
    self.hy_buttonsClickedHandler = handler;
    [self show];
}

- (void)hy_showWithDismissHandler:(HYAlertViewDismissHandler)handler {
    self.hy_dismissHandler = handler;
    [self show];
}

#pragma mark - Private Methods
- (void)setupSelfAsDelegate {
    
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

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    HYAlertViewDismissHandler clickHandler = alertView.hy_dismissHandler;
    if (clickHandler) {
        clickHandler(alertView, buttonIndex);
    }
    
    id delegate = objc_getAssociatedObject(self, HYAlertViewDelegateKey);
    if ([delegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:)]) {
        [delegate alertView:alertView didDismissWithButtonIndex:buttonIndex];
    }
}

#pragma mark - Getter && Setter
- (void)setHy_buttonsClickedHandler:(HYAlertViewClickButtonHandler)hy_buttonsClickedHandler {
    [self setupSelfAsDelegate];
    objc_setAssociatedObject(self, HYAlertViewButtonsClickedHandlerKey, hy_buttonsClickedHandler, OBJC_ASSOCIATION_COPY);
}

- (HYAlertViewClickButtonHandler)hy_buttonsClickedHandler {
    return objc_getAssociatedObject(self, HYAlertViewButtonsClickedHandlerKey);
}

- (void)setHy_dismissHandler:(HYAlertViewDismissHandler)hy_dismissHandler {
    [self setupSelfAsDelegate];
    objc_setAssociatedObject(self, HYAlertViewDismissHandlerKey, hy_dismissHandler, OBJC_ASSOCIATION_COPY);
}

- (HYAlertViewDismissHandler)hy_dismissHandler {
    return objc_getAssociatedObject(self, HYAlertViewDismissHandlerKey);
}

@end
