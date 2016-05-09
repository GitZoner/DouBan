//
//  NetWorkRequestManager.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
/**
 *  <#Description#>
 */
typedef NS_ENUM(NSInteger,requestType) {
    /**
     *  <#Description#>
     */
    GET,
    /**
     *  <#Description#>
     */
    POST,
    /**
     *  <#Description#>
     */
    DELETE,
    /**
     *  <#Description#>
     */
    PUT
};

typedef void(^successedBlock)(id data);
typedef void(^failedBlock) (NSError *error);

@interface NetWorkRequestManager : NSObject

// 适用宏单例，声明一个该类的单例方法
 singleton_interface(NetWorkRequestManager);
/**
 *  网络请求
 *
 *  @param type           请求方式
 *  @param urlString       URL 字符串
 *  @param param          请求参数
 *  @param successedBlock 请求成功执行的 block
 *  @param failBlock       请求失败执行的 block
 */

+(void)requestType:(requestType)type URLString:(NSString *)urlString Param:(NSDictionary *)param Successed:(successedBlock)successedBlock Failed:(failedBlock)failBlock;

@end
