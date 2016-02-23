//
//  HYTest1TableViewCell.m
//  HYUIKit
//
//  Created by YCLZONE on 2/16/16.
//  Copyright © 2016 yclzone. All rights reserved.
//

#import "HYTest1TableViewCell.h"
#import <HYUIKit/HYUIKit.h>

@interface HYTest1TableViewCell ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation HYTest1TableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.textField.delegate = self;
    
    [self.textField setHy_didBeginEditingBlock:^(UITextField *field) {
        NSLog(@"didBeginEditing");
    }];
    
    [self.textField setHy_didEndEditingBlock:^(UITextField *field) {
        NSLog(@"didEndEditing %@", field.text);
    }];
    
    [self.textField setHy_shouldBeginEditingBlock:^BOOL(UITextField *field) {
        if (!field.text.length) {
            return YES;
        } else if (field.text.length && [field.text isEqualToString:@"yclzone"]) {
            return NO;
        } else {
            return YES;
        }
    }];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s", __FUNCTION__);
}

@end
