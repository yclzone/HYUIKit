//
//  UIViewController+HYTextFieldEvent.h
//  Pods
//
//  Created by YCLZONE on 5/27/16.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (HYTextFieldEvent)
- (void)hy_observeEditingChangedForTextFields:(NSArray<UITextField *> *)textFields action:(SEL)action;
@end
