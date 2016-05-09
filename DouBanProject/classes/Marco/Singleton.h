//
//  Singleton.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h

/**
 *  宏单例
 *
 *  @param className 单例类名称
 *
 *  @return 一个类单例方法的声明部分和单例方法的实现部分
 */

// 单例声明(在宏里面\ 可以将两行代码连接成一个宏）
#define singleton_interface(className) \
+(instancetype)shared##className
// 单例的实现
#define singleton_implementation(className) \
static className *manager;\
+(instancetype)shared##className { \
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        manager = [[[self class] alloc] init ];\
    });\
    return manager;\
}

#endif /* Singleton_h */
