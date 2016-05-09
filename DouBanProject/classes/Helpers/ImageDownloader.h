//
//  ImageDownloader.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ImageDownloader;
@protocol ImageDownloaderDelegate <NSObject>

// 当获取到 UIImages数据的时候，代理对象执行这个方法
-(void)imageDownloader:(ImageDownloader *)imageDownloader didFinishedLoading:(UIImage *)image;

@end
@interface ImageDownloader : NSObject
// 声明代理属性
// @property (weak,nonatomic)id<ImageDownloaderDelegate> delegate;
#pragma mark --实例初始化方法
-(instancetype)initWithImageURLString:(NSString *)imageUrlString delegate:(id<ImageDownloaderDelegate>)delegate;
#pragma mark --便利构造器方法
+(instancetype)ImageDownloaderWithImageUrlString:(NSString *)imageUrlString delegate:(id<ImageDownloaderDelegate>)delegate;
@end
