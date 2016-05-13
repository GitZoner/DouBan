//
//  FileHandle.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/13.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "FileHandle.h"

// 存储对象类型的
#define kUserDefaults(object,key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]

// 存储 bool 类型的
#define kBoolUserDefaults(value,key)  [[NSUserDefaults standardUserDefaults]  setBool:value forKey:key]

// 获取对象类型的值
#define kGetObjectUserDefaults(key) [[NSUserDefaults standardUserDefaults] objectForKey: key]
// 获取 Bool 类型的值
#define kGetBoolUserDefaults(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]
@implementation FileHandle

// 存储 用户信息
+(void)saveUserInfo:(User *)user {
    kUserDefaults(user.userId, @"userId");
    kUserDefaults(user.userName, @"userName");
    kUserDefaults(user.password, @"userPassWord");
    kBoolUserDefaults(user.loginState, @"loginState");
    kBoolUserDefaults(user.avater, @"avater");
}

// 获取用户信息
+(User *)getUserInfo {
    User *user = [User new];
    
    user.userId = kGetObjectUserDefaults(@"userId");
    user.userName =  kGetObjectUserDefaults(@"userName");
    user.password =  kGetObjectUserDefaults(@"userPassWord");
    user.loginState =  kGetBoolUserDefaults(@"loginState");
    user.avater = kGetObjectUserDefaults(@"avater");
    return user;
    
}

// 删除用户信息
+(void)removeUserInfo {
    kUserDefaults(nil, @"userId");
    kUserDefaults(nil, @"userName");
    kUserDefaults(nil, @"passWord");
    kBoolUserDefaults(NULL, @"loginState");
    kUserDefaults(nil, @"avater");
}
@end
