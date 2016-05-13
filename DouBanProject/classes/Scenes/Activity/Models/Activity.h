//
//  Activity.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/11.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject
@property (nonatomic, copy) NSString *subcategory_name; //子分类

@property (nonatomic, copy) NSString *image;    //活动图片

@property (nonatomic, copy) NSString *adapt_url; //详情连接

@property (nonatomic, copy) NSString *loc_name; //所在城市

@property (nonatomic, copy) NSDictionary *owner; //举办方

@property (nonatomic, copy) NSString *alt; //

@property (nonatomic, copy) NSString *Id;   //活动id

@property (nonatomic, copy) NSString *category; //类别

@property (nonatomic, copy) NSString *title;    //活动题目

@property (nonatomic) NSInteger  wisher_count; //感兴趣人数

@property (nonatomic) BOOL *has_ticket; //是否有票

@property (nonatomic, copy) NSString *content;  //活动内容

@property (nonatomic, copy) NSString *can_invite;

@property (nonatomic, copy) NSString *album;

@property (nonatomic) NSInteger participant_count;  //参加人数

@property (nonatomic, copy) NSString *image_hlarge; //大图

@property (nonatomic, copy) NSArray *photos;

@property (nonatomic, copy) NSString *begin_time;   //开始时间

@property (nonatomic, copy) NSString *end_time; //结束时间

@property (nonatomic, copy) NSString *price_range;  //价格范围

@property (nonatomic, copy) NSString *geo;  //地理坐标

@property (nonatomic, copy) NSString *category_name;    //分类

@property (nonatomic, copy) NSString *loc_id;

@property (nonatomic, copy) NSString *address;  //地址

@property (nonatomic,copy) NSString * ID;


@end
