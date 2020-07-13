//
//  NSMutableDictionary+Safe.m
//  runtime_btn
//
//  Created by Jz D on 2020/7/13.
//  Copyright © 2020 Jz D. All rights reserved.
//

#import "NSMutableDictionary+Safe.h"




#import <objc/runtime.h>



@implementation NSMutableDictionary (Safe)


+ (void)load{
    
    
    // 类蔟，意味着它的真实类型，会发生变化
    
    Class real = NSClassFromString(@"__NSDictionaryM");
    Method kv = class_getInstanceMethod(real, @selector(setObject:forKeyedSubscript:));
    Method safeKv = class_getInstanceMethod(real, @selector(safeSetObject:forKeyedSubscript:));
    method_exchangeImplementations(kv, safeKv);
    
    
    
    
    
    
    //  -[__NSDictionaryM setObject:forKey:]: 
    
    // 底层调用的，好像不是
    
    //  '*** -[__NSDictionaryM setObject:forKeyedSubscript:]
}



- (void)safeSetObject:(id)obj forKeyedSubscript:(id<NSCopying>)key{
    if (key == nil){
        return;
    }
    [self safeSetObject:obj forKeyedSubscript:key];
}


@end
