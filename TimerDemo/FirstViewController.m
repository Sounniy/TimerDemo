//
//  FirstViewController.m
//  TimerDemo
//
//  Created by qinjiandong on 2019/6/21.
//  Copyright © 2019 qinjiandong. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(fire) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
        [_timer invalidate];
        _timer = nil;
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
