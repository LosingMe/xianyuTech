//
//  ViewController.m
//  runtime_btn
//
//  Created by Jz D on 2020/7/11.
//  Copyright © 2020 Jz D. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableDictionary * container = [NSMutableDictionary dictionary];
    container[@"name"] = @"hello";
    
    NSLog(@"container %@", container.class);
    NSString * var = nil;
    container[@"girl"] = var;
    
    
   // [container setObject:@"hand" forKey:var];
    container[var] = @"hand";
    NSLog(@"container %@", container);
}




- (void) demoArray{
      NSMutableArray * container = [NSMutableArray array];
      [container addObject: @"hello"];
      NSLog(@"NSMutableArray %@", container);
    //  NSLog(@"NSMutableArray %@", container.class);
      NSString * var = nil;
      
      [container addObject: var];
      
      
      
      // addObject： , 底层调用的是 insertObject: 方法
      
      
      //  3   CoreFoundation                      0x00007fff23ece563 -[__NSArrayM insertObject:atIndex:].cold.1 + 35
      
      NSLog(@"NSMutableArray %@", container);
}




- (IBAction)one:(id)sender {
    
    NSLog(@"%s 道吾恶者", __func__);
    
}


- (IBAction)two:(id)sender {
    
    
    NSLog(@"%s 是", __func__);
    
}





- (IBAction)three:(id)sender {
    
    
    NSLog(@"%s 吾师", __func__);
    
    
}




@end
