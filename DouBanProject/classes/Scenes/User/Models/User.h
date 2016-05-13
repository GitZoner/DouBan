//
//  User.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/13.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong,nonatomic)NSString *userName;// 用户名
@property (strong,nonatomic)NSString *password;// 密码
@property (strong,nonatomic)NSString *userId;// 用户 ID
@property (strong,nonatomic)NSString *avater;// 头像
@property (assign,nonatomic)BOOL loginState;// 用户登录状态


@end
