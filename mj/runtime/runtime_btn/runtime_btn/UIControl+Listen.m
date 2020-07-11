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
    
    if ([self isKindOfClass: UIButton.class ]){
        // 拦截按钮点击
        
    }
    else{
        
    }
    
    
    
    //  objc_msgSend(object, selector);
    //  通过 selector，去找方法实现
    
    // IMP ， 指向函数的指针， 函数地址
    
    
    
    //  selector
    //
}



@end
