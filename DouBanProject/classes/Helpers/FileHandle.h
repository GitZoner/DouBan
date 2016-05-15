//
//  FileHandle.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/13.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Singleton.h"
@interface FileHandle : NSObject
// 创建文件管理类工具的单例方法
// 使用宏单例的方式创建
singleton_interface(FileHandle);


// 根据 user model 对象存储用户信息
+(void)saveUserInfo:(User *)user;
+(void)removeUserInfo;
+(User *)getUserInfo;

#pragma mark - 创建数据库并返回路径
+ (NSString *)dataBasePath:(NSString *)dataBaseName;
@end
