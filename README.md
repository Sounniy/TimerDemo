# TimerDemo

NSTimer循环引用
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

开发过程中肯定会用到计时器,一般都会选择NSTimer,由于timer会在其内部对target强引用,而self.timer也会对timer强引用,这样就会产生循环引用问题。


￼
所以要解决循环引用就需要把这个循环断开

方法一:
在NSTimer结束使用的时候,自动结束对NSTimer的引用,如在viewWillDisappear内停止timer并置空
   [_timer invalidate];
        _timer = nil;
方法二:
添加一个中间变量变量target,打破self和timer的循环,让target和timer相互引用,在self dealloc内切断target和timer的循环引用
    //添加中转对象
    self.target =  [NSObject new];
    //动态添加方法
    class_addMethod([_target class], @selector(fire),class_getMethodImplementation([self class], @selector(fire)),"v@:");
    _timer = [NSTimer timerWithTimeInterval:1 target:_target selector:@selector(fire) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
方法三:
添加代理进行消息转发,打破self和timer的循环,让target和timer相互引用,在self dealloc内切断target和timer的循环引用
  _proxy = [JayProxy alloc];
    _proxy.target = self;
    _timer = [NSTimer timerWithTimeInterval:1 target:_proxy selector:@selector(fire) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
