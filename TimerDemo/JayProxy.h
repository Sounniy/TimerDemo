//
//  JayProxy.h
//  dictionary
//
//  Created by qinjiandong on 2019/6/21.
//  Copyright © 2019 qinjiandong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JayProxy : NSProxy


@property (nonatomic,weak)id target;
@end

NS_ASSUME_NONNULL_END
