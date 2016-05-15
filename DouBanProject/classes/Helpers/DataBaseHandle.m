//
//  DataBaseHandle.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/14.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "DataBaseHandle.h"
#import <sqlite3.h>
#import "FileHandle.h"
#import "Movie.h"
@implementation DataBaseHandle
// 归档

#pragma mark - 数据库单例对象
// 创建数据库的单例方法，确保数据库的唯一性
static DataBaseHandle *handle = nil;
+(instancetype)shareInstance {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        handle = [[self class] new];
        [handle openDB];
    });
    if (nil == handle) {
        
    }
    return handle;
}

#pragma mark -数据库的增删改查
static sqlite3 *db  = nil;
#pragma mark - 打开数据库
-(BOOL)openDB {
    if (nil != db) {
        return YES;
    }
    
    // 创建(或获取）数据库的的沙盒路径
    NSString *dateBasePath = [[FileHandle class]  dataBasePath:@"douban.sqlite"];
    // 打开数据库，第一个参数是数据库的完整路径
    // 如果数据库存在，是打开的操作，如果数据库文件不存在，先创建，再打开
    int result = sqlite3_open(dateBasePath.UTF8String, &db);
    if (result == SQLITE_OK) {
        NSLog(@"打开数据库成功");
        // 建表的 SQL 语句
        NSString *createTable = @"create table if not exists activityList (userName text,ID text ,title text,imageUrl text, data blob);create table movieList (userName text,ID integer autoincrement,title text,imageUrl text,data blob ";
        // 执行 SQL 语句
        sqlite3_exec(db, createTable.UTF8String, NULL, NULL, NULL);
        
    }
    return YES;
    
}

#pragma mark - 关闭数据库
-(BOOL)closeDB {
    int result = sqlite3_close(db);
    if (result == SQLITE_OK) {
        NSLog(@"关闭数据库成功");
        db = nil;
        return  YES;
    }else {
        return  NO;
    }
    
}

#pragma mark - 添加新的活动


#pragma mark - 电影收藏的增删改查
-(BOOL)insertNewMovie:(Movie *)movie {
    [self openDB];
    sqlite3_stmt *stmt = nil;
    NSString *sql = @"insert into movieList (userName,ID,title,imageUrl,data) values (?,?,?,?,?)";
    int result = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        sqlite3_bind_text([FileHandle sharedFileHandle].getUserInfo, <#int#>, <#const char *#>, <#int#>, <#void (*)(void *)#>)
    }
}

@end
