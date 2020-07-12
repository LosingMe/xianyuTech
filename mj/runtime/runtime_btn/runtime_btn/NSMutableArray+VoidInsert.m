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
    
    Method insert = class_getInstanceMethod(self, @selector(insertObject:atIndex:));
    Method safeInsert = class_getInstanceMethod(self, @selector(safeInsertObject:atIndex:));
    method_exchangeImplementations(insert, safeInsert);
    
    
}


- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index{
    
    
    NSLog(@"%@ - %@ - %zd", self, anObject, index);
    
}






@end
