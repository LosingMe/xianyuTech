//
//  UIControl+Listen.m
//  runtime_btn
//
//  Created by Jz D on 2020/7/11.
//  Copyright © 2020 Jz D. All rights reserved.
//

#import "UIControl+Listen.h"


#import <objc/runtime.h>



@implementation UIControl (Listen)



+ (void)load{
    
    Method tap = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method listen = class_getInstanceMethod(self, @selector(listenAction:to:forEvent:));
    method_exchangeImplementations(tap, listen);
    
    
}




- (void)listenAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event{
    
    
    NSLog(@"%@ - %@ - %@", self, target, NSStringFromSelector(action));
}



@end
