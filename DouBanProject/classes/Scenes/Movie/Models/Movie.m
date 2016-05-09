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

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
   
    key = [key isEqualToString:@"id"]? @"ID":key;
    [super setValue:value forKey:key];
    
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
