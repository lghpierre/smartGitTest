//
//  MyClass.h
//  SmellMe
//
//  Created by frostyhot on 14-2-11.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//
//在所有页面都可以使用的类
#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
@interface MyClass : NSObject
//发送一个Post来获取信息
+(void)sendAPostWithUrl:(NSURL*)url request:(ASIFormDataRequest*)postRequest cparam:(NSString*)cparam bparam:(NSString*)bparam;
@end
