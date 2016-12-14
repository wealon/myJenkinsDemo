//
//  UIColor+Ext.m
//  testGradientView
//
//  Created by wealon on 16/12/9.
//  Copyright © 2016年 MDJ. All rights reserved.
//

#import "UIColor+Ext.h"

@implementation UIColor (Ext)

//  字符串转颜色
+ (UIColor *)colorWithHexString:(NSString *)strColor
{
    if (nil == strColor) return nil;
    NSString *strProcess = [[strColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    
    if ([strProcess length] < 6)
        return [UIColor whiteColor];
    if ([strProcess hasPrefix:@"#"])
        strProcess = [strProcess substringFromIndex:1];
    if ([strProcess length] != 6)
        return [UIColor whiteColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *strRed = [strProcess substringWithRange:range];
    
    range.location = 2;
    NSString *strGreen = [strProcess substringWithRange:range];
    
    range.location = 4;
    NSString *strBlue = [strProcess substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:strRed] scanHexInt:&r];
    [[NSScanner scannerWithString:strGreen] scanHexInt:&g];
    [[NSScanner scannerWithString:strBlue] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


@end
