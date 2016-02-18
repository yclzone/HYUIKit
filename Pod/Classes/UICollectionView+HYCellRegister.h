//
//  UICollectionView+HYCellRegister.h
//  Pods
//
//  Created by YCLZONE on 2/16/16.
//
//

#import <UIKit/UIKit.h>

@interface UICollectionView (HYCellRegister)

/**
 *  注册Cell 重用ID为类名
 *
 *  @param classes Cell类数组
 */
- (void)hy_registerCellsWithClasses:(NSArray<Class> *)classes;

/**
 *  注册SupplementaryView 重用ID为类名
 *
 *  @param aClass 类名
 *  @param kind   SupplementaryView 种类
 */
- (void)hy_registerClass:(Class)aClass forSupplementaryViewOfKind:(NSString *)kind;
@end
