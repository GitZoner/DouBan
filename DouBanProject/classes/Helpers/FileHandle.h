//
//  FileHandle.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/13.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface FileHandle : NSObject

// 根据 user model 对象存储用户信息
+(void)saveUserInfo:(User *)user;
+(void)removeUserInfo;
+(User *)getUserInfo;
@end
