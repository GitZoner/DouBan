//
//  LoginViewController.h
//  Douban
//
//  Created by 张磊 on 16/5/6.
//  Copyright © 2016年 张磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
typedef void(^CompletionBlock)(User *);
@interface LoginViewController : UIViewController
// 登陆成功时候的回调
@property (copy,nonatomic)CompletionBlock completion;

@end
