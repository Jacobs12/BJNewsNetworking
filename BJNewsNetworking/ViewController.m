//
//  ViewController.m
//  BJNewsNetworking
//
//  Created by wolffy on 2017/8/2.
//  Copyright © 2017年 灰太狼. All rights reserved.
//

#import "ViewController.h"
#import "BJNewsNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [[BJNewsNetworking defaultManager] getWithHost:@"https://www.baidu.com" headers:@{@"key1":@"value1",@"key2":@"value2"} finished:^(NSURLResponse *response, NSData *responseData) {
//        
//    } failed:^(NSURLResponse *response, NSData *responseData) {
//        
//    }];
    [[BJNewsNetworking defaultManager] POSTWithHost:@"http://www.bjnews.com.cn" headers:@{@"key1":@"value1",@"key2":@"value2"} parameters:@{@"key6":@"value6",@"key7":@"value7"} finished:^(NSURLResponse *response, NSData *responseData) {
        
    } failed:^(NSURLResponse *response, NSData *responseData) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
