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
    
    // 开子线程
    // 拿到一个全局的并发队列
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"ha  ha");
        });
    });
    
    
    
    
//    [NSTimer scheduledTimerWithTimeInterval:3.0 repeats: NO block:^(NSTimer * _Nonnull timer) {
//        // 这里断点， bt
//        // 函数调用栈
//        NSLog(@"定时器");
//    }];
    
   // [self doObserve];
}


- (void) testAnd{
    
    
    NSLog(@"Foundation  current %p,  main %p", NSRunLoop.currentRunLoop, NSRunLoop.mainRunLoop);
    
    
    
    NSLog(@"Core Foundation  current %p,  main %p", CFRunLoopGetCurrent(),CFRunLoopGetMain());
    
    
    NSLog(@"%@", [NSRunLoop currentRunLoop]);
    
    
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




- (void) more{
    
    
    
    
    //  CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
    
    
    
    
    // source 0, 可以改的
    
    //  添加 source
    //  CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
    
    
    
    
    
    
    
    /*
    CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags kCFRunLoopAll, Boolean repeats, CFIndex order, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
    })
    */
    
    
    
    
    
    
    // 执行 block
    /*
    CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, ^{
        
    })
    */
    
    
    
    
    
}
// 希望 RunLoop 执行这个方法
// source 放方法，无法控制执行的时机













- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 这里断点， bt
    // 函数调用栈
    NSLog(@"%s", __func__);
    
    
//    // 可看出，定时器，能够唤醒线程
//    [NSTimer scheduledTimerWithTimeInterval:3.0 repeats: NO block:^(NSTimer * _Nonnull timer) {
//        // 这里断点， bt
//        // 函数调用栈
//        NSLog(@"定时器");
//    }];
    
}


@end
