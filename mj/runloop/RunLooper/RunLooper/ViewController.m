//
//  ViewController.m
//  RunLooper
//
//  Created by Jz D on 2020/7/14.
//  Copyright © 2020 Jz D. All rights reserved.
//

#import "ViewController.h"


// 监测 RunLoop 的状态

// C 语言的，回调函数
void observeRunLoopActivities(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void * info){
    
    
    CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"kCFRunLoopEntry,     %@", mode);
            break;
//        case kCFRunLoopBeforeTimers:
//            NSLog(@"kCFRunLoopBeforeTimers");
//            break;
//        case kCFRunLoopBeforeSources:
//            NSLog(@"kCFRunLoopBeforeSources");
//            break;
//        case kCFRunLoopBeforeWaiting:
//            NSLog(@"kCFRunLoopBeforeWaiting");
//            break;
//        case kCFRunLoopAfterWaiting:
//            NSLog(@"kCFRunLoopAfterWaiting");
//            break;
        case kCFRunLoopExit:
            NSLog(@"kCFRunLoopExit,     %@", mode);
            break;
            
        default:
            break;
    }
    CFRelease(mode);
    
}




@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
    NSLog(@"Foundation  current %p,  main %p", NSRunLoop.currentRunLoop, NSRunLoop.mainRunLoop);
    
    
    
    NSLog(@"Core Foundation  current %p,  main %p", CFRunLoopGetCurrent(),CFRunLoopGetMain());
    
    
    NSLog(@"%@", [NSRunLoop currentRunLoop]);
    */
    
    [self doObserve];
}




- (void) doObserve{
    
    //  CFOptionFlags activities ， 要监测的状态
    //  监听所有的状态， kCFRunLoopAllActivities
    
    
    
    //  CFRunLoopObserverCallBack callout, C 语言的回调函数
    
    
    
    
    //  CFRunLoopObserverContext *context， 传入参数
    //  对应 void * info
    
    
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, observeRunLoopActivities, NULL);
    
    
    
    
    // 监听不到 RunLoop 进入 Entry ，
    // 除非在程序启动的那一刻，就去监听
    
    // 这个时候监听，已经晚了
    // 程序已经进入了 entry
    
    
    //  kCFRunLoopCommonModes 通用模式，包含 default 和 UITracking
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    
    
    //  最终，要释放的
    //  C 语言，带有 create 和 copy 的，
    //  都需要 release
    // CFRelease(observer);
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    NSLog(@"%s", __func__);
    
    [NSTimer scheduledTimerWithTimeInterval:3.0 repeats: NO block:^(NSTimer * _Nonnull timer) {
        NSLog(@"定时器");
    }];
    
}


@end
