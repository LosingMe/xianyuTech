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
    
    NSMutableArray * container = [NSMutableArray array];
    [container addObject: @"hello"];
    
    NSString * var = nil;
    [container addObject: var];
    
    
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
