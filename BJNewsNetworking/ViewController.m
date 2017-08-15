//
//  ViewController.m
//  BJNewsNetworking
//
//  Created by wolffy on 2017/8/2.
//  Copyright © 2017年 灰太狼. All rights reserved.
//

#import "ViewController.h"
#import "BJNewsNetworking.h"
#import "NSString+Hashing.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

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
    
}




@end
