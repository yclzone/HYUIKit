//
//  UITextField+HYBlocks.m
//  Pods
//
//  Created by YCLZONE on 2/19/16.
//
//

#import "UITextField+HYBlocks.h"
#import <objc/runtime.h>

static void const *HYTextFieldDelegateKey           = &HYTextFieldDelegateKey;

static void const *HYTextFieldDidBeginEditingKey    = &HYTextFieldDidBeginEditingKey;
static void const *HYTextFieldDidEndEditingKey      = &HYTextFieldDidEndEditingKey;
static void const *HYTextFieldShouldBeginEditingKey = &HYTextFieldShouldBeginEditingKey;
static void const *HYTextFieldShouldEndEditingKey   = &HYTextFieldShouldEndEditingKey;

@implementation UITextField (HYBlocks)

#pragma mark - Public Methods
//

#pragma mark - Private Methods
- (void)setupSelfAsDelegate {
    id<UITextFieldDelegate> selfDelegate = (id<UITextFieldDelegate>) self;
    if (self.delegate != selfDelegate) {
        objc_setAssociatedObject(self, HYTextFieldDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = selfDelegate;
    }
    
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    HYTextFieldBlock block = textField.hy_didBeginEditingBlock;
    if (block) {
        block(textField);
    }
    
    id delegate = objc_getAssociatedObject(self, HYTextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    HYTextFieldBlock block = textField.hy_didEndEditingBlock;
    if (block) {
        block(textField);
    }
    
    id delegate = objc_getAssociatedObject(self, HYTextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [delegate textFieldDidEndEditing:textField];
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    HYTextFieldReturnBlock block = textField.hy_shouldBeginEditingBlock;
    if (block) {
        return block(textField);
    }
    
    id delegate = objc_getAssociatedObject(self, HYTextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [delegate textFieldShouldBeginEditing:textField];
    }
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    HYTextFieldReturnBlock block = textField.hy_shouldEndEditingBlock;
    if (block) {
        return block(textField);
    }
    
    id delegate = objc_getAssociatedObject(self, HYTextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [delegate textFieldShouldEndEditing:textField];
    }
    
    return YES;
}

#pragma mark - Getter && Setter
- (void)setHy_didBeginEditingBlock:(HYTextFieldBlock)hy_didBeginEditingBlock {
    [self setupSelfAsDelegate];
    objc_setAssociatedObject(self, HYTextFieldDidBeginEditingKey, hy_didBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (HYTextFieldBlock)hy_didBeginEditingBlock {
    return objc_getAssociatedObject(self, HYTextFieldDidBeginEditingKey);
}

- (void)setHy_didEndEditingBlock:(HYTextFieldBlock)hy_didEndEditingBlock {
    [self setupSelfAsDelegate];
    
    objc_setAssociatedObject(self, HYTextFieldDidEndEditingKey, hy_didEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (HYTextFieldBlock)hy_didEndEditingBlock {
    return objc_getAssociatedObject(self, HYTextFieldDidEndEditingKey);
}

- (void)setHy_shouldBeginEditingBlock:(HYTextFieldReturnBlock)hy_shouldBeginEditingBlock {
    [self setupSelfAsDelegate];
    
    objc_setAssociatedObject(self, HYTextFieldShouldBeginEditingKey, hy_shouldBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (HYTextFieldReturnBlock)hy_shouldBeginEditingBlock {
    return objc_getAssociatedObject(self, HYTextFieldShouldBeginEditingKey);
}

- (void)setHy_shouldEndEditingBlock:(HYTextFieldReturnBlock)hy_shouldEndEditingBlock {
    [self setupSelfAsDelegate];
    
    objc_setAssociatedObject(self, HYTextFieldShouldEndEditingKey, hy_shouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (HYTextFieldReturnBlock)hy_shouldEndEditingBlock {
    return objc_getAssociatedObject(self, HYTextFieldShouldEndEditingKey);
}

@end
