//
//  NetWorkRequestManager.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "NetWorkRequestManager.h"

@implementation NetWorkRequestManager



+(void)requestType:(requestType)type URLString:(NSString *)urlString Param:(NSDictionary *)param Successed:(successedBlock)successedBlock Failed:(failedBlock)failBlock {
    
    switch (type) {
        case GET:{
            NetWorkRequestManager *manager =  [NetWorkRequestManager sharedNetWorkRequestManager];
            [manager getWithURLString:urlString param:param success:successedBlock failed:failBlock];
            break;
        }
        case POST:{
            break;
        }
        case DELETE:{
            break;
        }
        case PUT:{
            break;
        }
        default:
            break;
    }
}

-(void)getWithURLString:(NSString *)urlString param:(NSDictionary *)dict success:(successedBlock)success failed:(failedBlock)fail {
    // 使用NSURLSession进行请求
    // 1.获取 session 对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 2.拼接字符串 (设置请求体）
    NSMutableString *urlStr = [NSMutableString stringWithString:urlString];
    
    if (dict) {
        [urlStr appendString:@"?"];
        [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [ urlStr appendString:[NSString stringWithFormat:@"%@=%@&",key,obj]];
        }];
        
        // 合并后的请求体的最后带有一个&，要去掉它
        [urlStr substringToIndex:urlStr.length - 2];
    }
    
    // 2. 转码
    // 对请求体中的文本进行转码，避免汉字等特殊字符不识别的情况
    // 把字符串放到一个字符集合里
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:urlStr];
    NSString *url = [urlStr stringByAddingPercentEncodingWithAllowedCharacters: set];
    // 4. 设置 request 对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url ]];
    // 5.设置请求方式
    request.HTTPMethod = @"GET";
    // 6.链接并发送请求
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data && !error) {
            // 这是一个封装，要求适用不止一种请求，只负责请求，不需要负责解析
            NSLog(@"已成功获取网路请求数据");
            success(data);
        }else {
            if (!data) {
                NSLog(@"请求数据为空");
            }
            
            if (error) {
                fail(error);
            }
        }
    }];
    
    [dataTask resume];
    
}

// 适用宏单例的实现 实现该类的单例方法
singleton_implementation(NetWorkRequestManager);
@end
