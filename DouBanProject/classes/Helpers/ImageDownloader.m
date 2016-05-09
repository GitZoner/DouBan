//
//  ImageDownloader.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader

+(instancetype)ImageDownloaderWithImageUrlString:(NSString *)imageUrlString delegate:(id<ImageDownloaderDelegate>)delegate {
    return [[[self class]  alloc] initWithImageURLString:imageUrlString delegate:delegate];
}

-(instancetype)initWithImageURLString:(NSString *)imageUrlString delegate:(id<ImageDownloaderDelegate>)delegate {
    if (self = [super init]) {
        
        __weak typeof (ImageDownloader *) downloader = self;
        // 1. 准备 URL
        NSURL *url = [NSURL URLWithString:imageUrlString];
        // 2, 创建请求对象
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        // 3, 创建连接对象 ，并发送请求
        [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            if (!data) {
                return ;
            }
            
            // 4, 图片传值
            UIImage *image = [UIImage imageWithData:data];
            // 5,让代理执行代理方法，将图片传出；
            [delegate imageDownloader:downloader didFinishedLoading:image];
        }];
    }
    return self;
}

@end
