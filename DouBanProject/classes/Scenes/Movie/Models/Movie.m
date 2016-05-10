//
//  Movie.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "Movie.h"
#import "ImageDownloader.h"

@interface Movie() <ImageDownloaderDelegate>

@end
@implementation Movie
// 重写 setValue：forUndefinedKey
// 如果
-(void)setValue:(id)value forKey:(NSString *)key {
   
    key = [key isEqualToString:@"id"]? @"ID":key;
    // super调用自己的方法，避免循环调用的问题
    [super setValue:value forKey:key];
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(void)loadImage {
    NSString *imageUrlString = self.images[@"medium"];
    [ImageDownloader ImageDownloaderWithImageUrlString:imageUrlString delegate:self];
}

#pragma mark - ImageDownloaderDelegate
-(void)imageDownloader:(ImageDownloader *)imageDownloader didFinishedLoading:(UIImage *)image {
    self.image = image;
}
@end
