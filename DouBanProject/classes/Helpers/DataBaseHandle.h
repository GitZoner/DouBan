//
//  DataBaseHandle.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/14.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Activity;
@class Movie;
@interface DataBaseHandle : NSObject


+(instancetype)shareInstance;

#pragma mark 打开数据库
-(BOOL)openDB;
#pragma mark 关闭数据库
-(BOOL)closeDB;
#pragma mark --Activity 活动 数据库操作 --
#pragma mark -添加新的活动
-(BOOL)insertNewActivity:(Activity *)activity;
#pragma mark -删除某一活动
-(BOOL)delegateActivity:(Activity *)activity;
#pragma mark - 获取某一活动对象
-(Activity *)selectActivityWtihID:(NSString *)ID;
#pragma mark -获取所有活动
-(NSArray *)selectAllActivities;

#pragma mark -判断活动是否已被收藏
-(BOOL)isFavoriteActivityWtihID:(NSString *)ID;
#pragma mark -- Movie电影 数据库的操作--
#pragma mark - 添加新电影
-(BOOL)insertNewMovie:(Movie *)movie;
#pragma mark - 删除某个电影
-(BOOL)deleteMovie:(Movie *)movie;
#pragma mark - 获取某个电影对象
-(Movie *)selectMovieWith:(NSString *)ID;
#pragma mark - 获取所有电影
- (NSArray *)selectAllMovie;
#pragma mark - 判读某个电影是否已经被收藏
-(BOOL)isFavoriteMovieWithID:(NSString *)ID;
@end
