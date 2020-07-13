//
//  UIFont+PF.m
//  runtime_btn
//
//  Created by Jz D on 2020/7/14.
//  Copyright © 2020 Jz D. All rights reserved.
//

#import "UIFont+PF.h"




#import <objc/runtime.h>



@implementation UIFont (PF)





+ (void)load{
    
    Method f = class_getClassMethod(self, @selector(fontWithName:size:));
    Method pF = class_getClassMethod(self, @selector(pfFontWithName:size:));
    method_exchangeImplementations(f, pF);
    
}

 

+ (UIFont *)pfFontWithName:(NSString *)fontName size:(CGFloat)fontSize{
    
    
    return [self pfFontWithName: @"PingFangSC" size: 50];
    
}



@end
