//
//  BJNewsNetworking.m
//  BJNewsNetworking
//
//  Created by wolffy on 2017/8/2.
//  Copyright © 2017年 灰太狼. All rights reserved.
//

#import "BJNewsNetworking.h"
#import "BJNewsSessionRequest.h"

static BJNewsNetworking * bjnews_net_manager = nil;

@implementation BJNewsNetworking

+ (BJNewsNetworking *)defaultManager{
    if(bjnews_net_manager == nil){
        bjnews_net_manager = [[BJNewsNetworking alloc]init];
    }
    return bjnews_net_manager;
}

/**
 发起GET请求
 
 @param host 主机url
 @param headers 请求头
 @param finished 成功回调
 @param failed 失败回调
 */

- (void)GETWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse *, NSData *))finished failed:(void (^)(NSURLResponse *, NSData *))failed{
    BJNewsSessionRequest * request = [[BJNewsSessionRequest alloc]init];
    [request GETWithHost:host headers:headers finished:finished failed:failed];
}

/**
 发起POST请求
 
 @param host 主机url
 @param headers 请求头
 @param parameters 请求体
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)POSTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    BJNewsSessionRequest * request = [[BJNewsSessionRequest alloc]init];
    [request POSTWithHost:host headers:headers parameters:parameters finished:finished failed:failed];
}

/**
 发起PUT请求
 
 @param host 主机url
 @param headers 请求头
 @param parameters 请求体
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)PUTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    BJNewsSessionRequest * request = [[BJNewsSessionRequest alloc]init];
    [request PUTWithHost:host headers:headers parameters:parameters finished:finished failed:failed];
}

/**
 发起DELETE请求
 
 @param host 主机url
 @param headers 请求头
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)DELETEWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    BJNewsSessionRequest * request = [[BJNewsSessionRequest alloc]init];
    [request DELETEWithHost:host headers:headers finished:finished failed:failed];
}

@end
