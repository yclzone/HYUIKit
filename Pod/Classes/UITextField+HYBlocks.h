//
//  UITextField+HYBlocks.h
//  Pods
//
//  Created by YCLZONE on 2/19/16.
//
//

#import <UIKit/UIKit.h>

/*
 
 - (void)textFieldDidBeginEditing:(UITextField *)textField;
 - (void)textFieldDidEndEditing:(UITextField *)textField;
 - (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
 - (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
 - (BOOL)textFieldShouldClear:(UITextField *)textField;
 - (BOOL)textFieldShouldReturn:(UITextField *)textField;
 
 */

typedef BOOL(^HYTextFieldReturnBlock)(UITextField *field);
typedef void(^HYTextFieldBlock)(UITextField *field);

@interface UITextField (HYBlocks)
/** -textFieldDidBeginEditing: */
@property (nonatomic, copy) HYTextFieldBlock hy_didBeginEditingBlock;
/** -textFieldDidEndEditing: */
@property (nonatomic, copy) HYTextFieldBlock hy_didEndEditingBlock;
/** -textFieldShouldBeginEditing: */
@property (nonatomic, copy) HYTextFieldReturnBlock hy_shouldBeginEditingBlock;
/** -textFieldShouldEndEditing: */
@property (nonatomic, copy) HYTextFieldReturnBlock hy_shouldEndEditingBlock;

- (void)setHy_didBeginEditingBlock:(HYTextFieldBlock)hy_didBeginEditingBlock;
- (void)setHy_didEndEditingBlock:(HYTextFieldBlock)hy_didEndEditingBlock;
- (void)setHy_shouldBeginEditingBlock:(HYTextFieldReturnBlock)hy_shouldBeginEditingBlock;
- (void)setHy_shouldEndEditingBlock:(HYTextFieldReturnBlock)hy_shouldEndEditingBlock;

@end
