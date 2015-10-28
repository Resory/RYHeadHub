//
//  UIColor+Category.h
//  WindowHub
//
//  Created by Resory on 15/10/10.
//  Copyright © 2015年 github.com/resory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)


/**
 *  16进制色
 *
 *  @param color 16进制
 *  @param alpha 透明度
 *
 *  @return 返回颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
