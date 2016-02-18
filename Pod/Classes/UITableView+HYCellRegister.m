//
//  UITableView+HYCellRegister.m
//  Pods
//
//  Created by YCLZONE on 2/16/16.
//
//

#import "UITableView+HYCellRegister.h"

@implementation UITableView (HYCellRegister)

- (void)hy_registerCellsWithClasses:(NSArray<Class> *)classes {
    for (Class aClass in classes) {
        NSString *className = NSStringFromClass(aClass);
        
        NSString *nibPath = [[NSBundle mainBundle] pathForResource:className ofType:@"nib"];
        if (nibPath) {
            UINib *nib = [UINib nibWithNibName:className bundle:nil];
            [self registerNib:nib forCellReuseIdentifier:className];
        } else {
            [self registerClass:aClass forCellReuseIdentifier:className];
        }
    }
}
@end
