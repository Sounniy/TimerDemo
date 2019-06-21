//
//  SecondViewController.m
//  TimerDemo
//
//  Created by qinjiandong on 2019/6/21.
//  Copyright © 2019 qinjiandong. All rights reserved.
//

#import "SecondViewController.h"
#import <objc/runtime.h>

@interface SecondViewController ()
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)NSObject *target;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //添加中转对象
    self.target =  [NSObject new];
    //动态添加方法
    class_addMethod([_target class], @selector(fire),class_getMethodImplementation([self class], @selector(fire)),"v@:");
    _timer = [NSTimer timerWithTimeInterval:1 target:_target selector:@selector(fire) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)fire{
    NSLog(@"fire");
}
- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
    NSLog(@"dealloc");
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
