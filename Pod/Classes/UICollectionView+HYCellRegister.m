//
//  UICollectionView+HYCellRegister.m
//  Pods
//
//  Created by YCLZONE on 2/16/16.
//
//

#import "UICollectionView+HYCellRegister.h"

@implementation UICollectionView (HYCellRegister)
- (void)hy_registerCellsWithClasses:(NSArray<Class> *)classes {
    for (Class aClass in classes) {
        NSString *className = NSStringFromClass(aClass);
        // 判断nib文件是否存在
        NSString *pathString = [[NSBundle mainBundle] pathForResource:className ofType:@"nib"];
        if (pathString) {
            UINib *nib = [UINib nibWithNibName:className bundle:nil];
            [self registerNib:nib forCellWithReuseIdentifier:className];
        } else {
            [self registerClass:aClass forCellWithReuseIdentifier:className];
        }
        
    }
}

- (void)hy_registerClass:(Class)aClass forSupplementaryViewOfKind:(NSString *)kind {
    NSString *className = NSStringFromClass([aClass class]);
    // 判断nib文件是否存在
    NSString *pathString = [[NSBundle mainBundle] pathForResource:className ofType:@"nib"];
    
    if (pathString) {
        [self registerNib:[UINib nibWithNibName:className bundle:nil] forSupplementaryViewOfKind:kind withReuseIdentifier:className];
    } else {
        [self registerClass:aClass forSupplementaryViewOfKind:kind withReuseIdentifier:className];
    }
    
}
@end
