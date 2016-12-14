//
//  UIView+Gradient.m
//  testGradientView
//
//  Created by wealon on 16/12/9.
//  Copyright © 2016年 MDJ. All rights reserved.
//

#import "UIView+Gradient.h"
#import "Masonry.h"

@implementation UIView (Gradient)

- (CAGradientLayer *)setGradientColorFromColor:(UIColor *)startC
                                       ToColor:(UIColor *)endC
{
    CGPoint inputPoint0 = CGPointMake(0.5, 0.4);
    CGPoint inputPoint1 = CGPointMake(0.5, 0.6);
    
    UIColor *inputColor0 = startC;
    UIColor *inputColor1 = endC;
    
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    layer.frame = self.bounds;
    
    layer.colors = @[(__bridge id)inputColor0.CGColor, (__bridge id)inputColor1.CGColor];
    layer.startPoint = inputPoint0;
    layer.endPoint = inputPoint1;
    layer.type = kCAGradientLayerAxial;
    
    [self.layer insertSublayer:layer atIndex:0];
    
    return layer;
}


@end
