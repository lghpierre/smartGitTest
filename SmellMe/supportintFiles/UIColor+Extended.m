//
//  UIColor+Extension.m
//  IQIrregularView Demo
//
//  Copyright (c) 2013 Mohd Iftekhar Qurashi

#import "UIColor+Extended.h"

@implementation UIColor (Extension)

+(UIColor*)randomColor
{
    CGFloat red     = ( arc4random() % 256);
    CGFloat green   = ( arc4random() % 256);
    CGFloat blue    = ( arc4random() % 256);
    
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1];
}
+(UIColor*)pinchColor{
    CGFloat red = 251;
    CGFloat green = 128;
    CGFloat blue = 143;
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}
+(UIColor*)lightPinchColor{
    CGFloat red = 254;
    CGFloat green = 179;
    CGFloat blue = 181;
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}
+(UIColor*)darkPinckColor{
    CGFloat red = 251;
    CGFloat green = 81;
    CGFloat blue = 99;
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}
+(UIColor*)navigationBarColorBegin{
    CGFloat red = 242;
    CGFloat green = 118;
    CGFloat blue = 126;
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
    
}
+(UIColor*)navigationBarColorEnd{
    CGFloat red = 212;
    CGFloat green = 92;
    CGFloat blue = 105;
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}
+(UIColor*)pullBtnColor{
    return [UIColor colorWithRed:212/255.0 green:92/255.0 blue:105/255.0 alpha:1.0];
}
@end
