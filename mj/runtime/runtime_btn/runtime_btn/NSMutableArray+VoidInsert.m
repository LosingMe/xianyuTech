//
//  NSMutableArray+VoidInsert.m
//  runtime_btn
//
//  Created by Jz D on 2020/7/12.
//  Copyright © 2020 Jz D. All rights reserved.
//

#import "NSMutableArray+VoidInsert.h"



#import <objc/runtime.h>



@implementation NSMutableArray (VoidInsert)


+ (void)load{
    
    //  NSMutableArray 是表面的类型，
    // 他的 isa 指针，指向的真实的类型， 不是 NSMutableArray
    
    // 真实类型是  __NSArrayM
    
    // 这个是类簇 ，不止 NSArray, 还有 NSString, NSDictionary
    // 他们的真实类型，是其他类型
    
    // Foundation 框架的特色
    
    Class real = NSClassFromString(@"__NSArrayM");
    Method insert = class_getInstanceMethod(real, @selector(insertObject:atIndex:));
    Method safeInsert = class_getInstanceMethod(real, @selector(safeInsertObject:atIndex:));
    method_exchangeImplementations(insert, safeInsert);
    
    
}


- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject == nil) {
        return;
    }
 //   NSLog(@"%zd", index);
    [self safeInsertObject:anObject atIndex:index];
}






@end
