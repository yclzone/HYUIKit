//
//  UIViewController+HYTextFieldEvent.m
//  Pods
//
//  Created by YCLZONE on 5/27/16.
//
//

#import "UIViewController+HYTextFieldEvent.h"

@implementation UIViewController (HYTextFieldEvent)
- (void)hy_observeEditingChangedForTextFields:(NSArray<UITextField *> *)textFields action:(SEL)action {
    for (UITextField *textField in textFields) {
        [textField addTarget:self action:action forControlEvents:UIControlEventEditingChanged];
    }
}
@end
