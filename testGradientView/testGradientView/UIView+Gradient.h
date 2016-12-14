//
//  UIView+Gradient.h
//  testGradientView
//
//  Created by wealon on 16/12/9.
//  Copyright © 2016年 MDJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gradient)

- (CAGradientLayer *)setGradientColorFromColor:(UIColor *)startC
                                       ToColor:(UIColor *)endC;

@end
