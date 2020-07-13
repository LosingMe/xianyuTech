//
//  ViewController.m
//  RunLooper
//
//  Created by Jz D on 2020/7/14.
//  Copyright © 2020 Jz D. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSLog(@"Foundation  current %p,  main %p", NSRunLoop.currentRunLoop, NSRunLoop.mainRunLoop);
    
    
    
    NSLog(@"Core Foundation  current %p,  main %p", CFRunLoopGetCurrent(),CFRunLoopGetMain());
    
    
    
    
}


@end
