//
//  MyClass.m
//  SmellMe
//
//  Created by frostyhot on 14-2-11.
//  Copyright (c) 2014年 frostyhot. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass
+(void)sendAPostWithUrl:(NSURL*)url request:(ASIFormDataRequest*)postRequest cparam:(NSString*)cparam bparam:(NSString*)bparam{
    //分界线的标识符
    NSString *TWITTERFON_FORM_BOUNDARY = @"Boundary+0xAbCdEfGbOuNdArY";
    //分界线 --Boundary+0xAbCdEfGbOuNdArY
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
    //结束符 Boundary+0xAbCdEfGbOuNdArY--
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
    //http body的字符串
    NSMutableString *body = [[NSMutableString alloc] init];
    
    //开始拼凑
    //添加分界线，换行
    [body appendFormat:@"%@\r\n",MPboundary];
    //添加字段名称，换2行
    [body appendFormat:@"%@",@"Content-Disposition: form-data; name=\"cparam\"\r\n\r\n"];
    //添加字段的值
    [body appendFormat:@"%@\r\n",cparam];
    ////添加分界线，换行
    [body appendFormat:@"%@\r\n",MPboundary];
    //添加字段
    [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",@"bparam"];
    //添加字段的值
    [body appendFormat:@"%@\r\n",bparam];
    //添加分界线
    [body appendFormat:@"%@",endMPboundary];
    
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData=[NSMutableData data];
    //将body字符串转化为UTF8格式的二进制
    [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    [postRequest setRequestMethod:@"POST"];
    
    [postRequest addRequestHeader:@"Content-Type" value:@"multipart/form-data; boundary=Boundary+0xAbCdEfGbOuNdArY"];
    
    [postRequest setPostBody:myRequestData];
    
    [postRequest startAsynchronous];
    
    [postRequest setFailedBlock:^{
        NSLog(@"网络不给力");
    }];
    
}
@end
