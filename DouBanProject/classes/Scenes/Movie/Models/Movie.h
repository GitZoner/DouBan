//
//  Movie.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Movie : NSObject
#pragma mark - 电影主页属性
@property (nonatomic, copy) NSString *collection;       //
@property (nonatomic, copy) NSString *ID;               // id
@property (nonatomic, strong) NSDictionary *images;     // 图片数组
@property (nonatomic, copy) NSString *original_title;   //
@property (nonatomic, copy) NSString *orignal_title;    //
@property (nonatomic, copy) NSString *pubdate;          // 上映时间
@property (nonatomic, strong) NSDictionary *rating;           // 评分
@property (nonatomic, copy) NSString *stars;            // 星级
@property (nonatomic, copy) NSString *title;            // 标题
@property (nonatomic, copy) NSString *wish;             //
// 自己添加的一个属性，不再数据解析里面的属性
@property (nonatomic, strong) UIImage *image;           // 图片

-(void)loadImage;

#pragma mark -详情页的属性
@property (nonatomic, copy) NSString *summary;          // 电影简介
@property (nonatomic, strong) NSArray *genres;          // 分类
@property (nonatomic, strong) NSArray *countries;       // 国家
@property (nonatomic, strong) NSArray *durations;       // 时长
@property (nonatomic, copy) NSString *comments_count;   // 评论人数

@end
