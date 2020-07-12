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
    
    Class real = NSClassFromString(@"__NSDictionaryM");
    Method kv = class_getInstanceMethod(real, @selector(setObject:forKeyedSubscript:));
    Method safeKv = class_getInstanceMethod(real, @selector(safeSetObject:forKeyedSubscript:));
 //   method_exchangeImplementations(kv, safeKv);
    
    
    //  '*** -[__NSDictionaryM setObject:forKeyedSubscript:]
    
    // 底层调用的，好像不是
    
    //  -[__NSDictionaryM setObject:forKey:]: 
    
    
}



- (void)safeSetObject:(id)obj forKeyedSubscript:(id<NSCopying>)key{
    
}


@end
