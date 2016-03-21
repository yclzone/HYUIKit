//
//  UIColor+HYRGB.h
//  Pods
//
//  Created by YCLZONE on 3/21/16.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (HYRGB)
#ifndef kRGBA
#define kRGBA(r, g, b, a)       [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#endif

#ifndef kRGB16
#define kRGB16(value,a)         [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0xFF00) >> 8))/255.0 blue:((float)(value & 0xFF))/255.0 alpha:a]
#endif
@end
