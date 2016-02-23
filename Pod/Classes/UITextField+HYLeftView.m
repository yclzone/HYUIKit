//
//  UITextField+HYLeftView.m
//  Pods
//
//  Created by YCLZONE on 2/23/16.
//
//

#import "UITextField+HYLeftView.h"

@implementation UITextField (HYLeftView)

-(void)setLeftViewByImageView:(UIImage*)image{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageView.image = image;
    self.leftView = imageView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setupTextIndentation:(CGFloat)indentation {
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, indentation, self.bounds.size.height)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.userInteractionEnabled = NO;
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}
@end
