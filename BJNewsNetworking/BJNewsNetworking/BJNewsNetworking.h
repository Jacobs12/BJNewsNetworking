//
//  BJNewsNetworking.h
//  BJNewsNetworking
//
//  Created by wolffy on 2017/8/2.
//  Copyright © 2017年 灰太狼. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BJNewsNetworking : NSObject

+ (BJNewsNetworking *)defaultManager;

#pragma mark - 
#pragma mark - 基础 GET POST PUT DELETE

/**
 发起GET请求
 
 @param host 主机url
 @param headers 请求头
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)GETWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

/**
 发起POST请求

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

#pragma mark - 
#pragma mark - Upload Image

/**
 以PUT方式上传头像

 @param host 主机url
 @param headers 请求头
 @param parameters 请求体
 @param fileData 需要上传的图片
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)PUTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters userAccount:(NSString *)userAccount uploadFileData:(NSData *)fileData fileKey:(NSString *)fileKey secretKey:(NSString *)key finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

@end
