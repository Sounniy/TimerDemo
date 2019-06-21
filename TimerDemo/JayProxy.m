//
//  JayProxy.m
//  dictionary
//
//  Created by qinjiandong on 2019/6/21.
//  Copyright © 2019 qinjiandong. All rights reserved.
//

#import "JayProxy.h"

@implementation JayProxy

- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}
- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.target];
}
@end
