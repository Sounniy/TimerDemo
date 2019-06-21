//
//  ThirdViewController.m
//  TimerDemo
//
//  Created by qinjiandong on 2019/6/21.
//  Copyright © 2019 qinjiandong. All rights reserved.
//

#import "ThirdViewController.h"
#import "JayProxy.h"

@interface ThirdViewController ()
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)JayProxy *proxy;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置消息转发代理
    _proxy = [JayProxy alloc];
    _proxy.target = self;
    _timer = [NSTimer timerWithTimeInterval:1 target:_proxy selector:@selector(fire) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}
- (void)fire{
    NSLog(@"fire");
}
- (void)dealloc
{
//清除timer
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
