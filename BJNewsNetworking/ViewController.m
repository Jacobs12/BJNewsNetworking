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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getTest{
    
}

- (void)postTest{
    
}

- (void)postImageTest{
        [[BJNewsNetworking defaultManager] POSTWithHost:@"http://www.bjnews.com.cn" headers:@{@"key1":@"value1",@"key2":@"value2"} parameters:@{@"key6":@"value6",@"key7":@"value7"} finished:^(NSURLResponse *response, NSData *responseData) {
    
        } failed:^(NSURLResponse *response, NSData *responseData) {
    
        }];

}

- (void)putTest{
    
}

- (void)uploadImageTest:(NSData *)imageData{
    
    NSString * key = @"T5JVPtxu5E24hYZVFHKDtsxJKszDnrSamTTxMTGPbcWKewcayyKE68LMy7LyBver";
    NSString * user = @"13693544328";
    NSString * passWord = @"123456";
    
    NSString * host = @"http://dp.bjnews.com.cn/api/session";
    NSString * signStr = [NSString stringWithFormat:@"%@%@%@",key,user,[self getSignString:passWord]];
    NSString * sign = [self getSignString:signStr];
    NSDictionary * header = @{@"Mobile":user,@"Sign":sign};
    [[BJNewsNetworking defaultManager] POSTWithHost:host headers:header parameters:nil finished:^(NSURLResponse *response, NSData *responseData) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
        NSDictionary * data = dict[@"data"];
        NSString * access_token = data[@"access_token"];
        NSLog(@"%ld",imageData.length);
        NSString * host2 = @"http://dp.bjnews.com.cn/api/user";
        NSDictionary * parameters = @{};
        NSDictionary * headers = @{@"Access-Token":access_token,@"Mobile":user};
        [[BJNewsNetworking defaultManager] PUTWithHost:host2 headers:headers parameters:parameters userAccount:user uploadFileData:imageData fileKey:@"face" secretKey:key finished:^(NSURLResponse *response, NSData *responseData) {
            [self log:responseData];
        } failed:^(NSURLResponse *response, NSData *responseData) {
            
        }];
    } failed:^(NSURLResponse *response, NSData *responseData) {
        
    }];
}

- (void)log:(NSData *)responseData{
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    NSDictionary * data = dict[@"data"];
    NSString * face = data[@"face"];
    NSString * str = [face stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    NSLog(@"%@",str);
}

- (void)deleteTest{
    
}

#pragma mark -
- (IBAction)imagePickButtonClick:(id)sender{
    [self imagePickController];
}

- (UIImagePickerController *)imagePickController{
    UIImagePickerController * imagePick = [[UIImagePickerController alloc]init];
    imagePick.allowsEditing = YES;
    imagePick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePick.delegate = self;
    [self presentViewController:imagePick animated:YES completion:^{
        
    }];
    return imagePick;
}

//返回的图片数据
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];
    NSData * data = [self imageWithImage:[UIImage imageWithData:UIImageJPEGRepresentation(image,0.14)] scaledToSize:CGSizeMake(200, 200)];
    dispatch_async(dispatch_get_main_queue(), ^{ // 方法一：异步赋值

    });
    [picker dismissViewControllerAnimated:YES completion:^{ // 方法二：等UIImagePickerController消失后再去调用image
        [self uploadImageTest:data];
    }];
}

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

- (NSData *)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(newImage, 0.8);
}

@end
