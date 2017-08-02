//
//  BJNewsSessionRequest.h
//  BJNewsNetworking
//
//  Created by wolffy on 2017/8/2.
//  Copyright © 2017年 灰太狼. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJNewsSessionRequest : NSObject

typedef NS_ENUM(NSInteger,BJNewsSessionRequestMethod){
    BJNewsSessionRequestMethodGet,
    BJNewsSessionRequestMethodPost,
    BJNewsSessionRequestMethodPut,
    BJNewsSessionRequestMethodDelete
};

typedef NS_ENUM(NSInteger,BJNewsParametersType){
    BJNewsParametersTypeText,
    BJNewsParametersTypeJson
};

@property (nonatomic,strong) NSURLSessionDataTask * dataTask;

/**
 发起GET请求
 读取
 
 @param host 主机url
 @param headers 请求头
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)GETWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

/**
 发起POST请求
 增添
 
 @param host 主机url
 @param headers 请求头
 @param parameters 请求体
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)POSTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

/**
 发起PUT请求
 
 @param host 主机url
 @param headers 请求头
 @param parameters 请求体
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)PUTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

/**
 发起DELETE请求
 
 @param host 主机url
 @param headers 请求头
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)DELETEWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

@end
