//
//  BJNewsNetworking.m
//  BJNewsNetworking
//
//  Created by wolffy on 2017/8/2.
//  Copyright © 2017年 灰太狼. All rights reserved.
//

#import "BJNewsNetworking.h"
#import "BJNewsSessionRequest.h"
#import "GTMBase64.h"
#import "NSString+Hashing.h"

static BJNewsNetworking * bjnews_net_manager = nil;

@implementation BJNewsNetworking

+ (BJNewsNetworking *)defaultManager{
    if(bjnews_net_manager == nil){
        bjnews_net_manager = [[BJNewsNetworking alloc]init];
    }
    return bjnews_net_manager;
}

#pragma mark -
#pragma mark - GET

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

#pragma mark - POST

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

#pragma mark - PUT

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

#pragma mark - DELETE

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

/**
 以PUT方式上传头像
 
 @param host 主机url
 @param headers 请求头
 @param parameters 请求体
 @param fileData 需要上传的图片
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)PUTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters userAccount:(NSString *)userAccount uploadFileData:(NSData *)fileData fileKey:(NSString *)fileKey secretKey:(NSString *)secretKey finished:(void (^)(NSURLResponse *, NSData *))finished failed:(void (^)(NSURLResponse *, NSData *))failed{
    NSMutableDictionary * tempParameters = [[NSMutableDictionary alloc]initWithDictionary:parameters];
    NSMutableDictionary * tempHeaders = [[NSMutableDictionary alloc]initWithDictionary:headers];
//    base64图片
    NSData * encodeData = [GTMBase64 encodeData:fileData];
    NSString * encodeString = [[NSString alloc]initWithData:encodeData encoding:NSUTF8StringEncoding];
    [tempParameters setValue:encodeString forKey:fileKey];
//    sign = md5( md5( base64( 图片 ) ) + key + mobile )
    NSString * md5_image = [self getSignString:encodeString];
    NSString * signStr = [NSString stringWithFormat:@"%@%@%@",md5_image,secretKey,userAccount];
    NSString * sign = [self getSignString:signStr];
    [tempHeaders setValue:sign forKey:@"Sign"];
    
    [self PUTWithHost:host headers:tempHeaders parameters:tempParameters finished:finished failed:failed];
}

#pragma mark -
#pragma mark - others

- (NSString *)getSignString:(NSString *)string{
    NSString * sign1 = [[NSString stringWithFormat:@"%@",string] MD5Hash];
    NSMutableString * str = [[NSMutableString alloc]init];
    for(int i=0;i<sign1.length;i++){
        char c = [sign1 characterAtIndex:i];
        if(c >= 'A' && c <= 'Z'){
            c += 32;
        }
        [str appendFormat:@"%c",c];
    }
    NSString * sign = [NSString stringWithFormat:@"%@",str];
    return sign;
}

@end
