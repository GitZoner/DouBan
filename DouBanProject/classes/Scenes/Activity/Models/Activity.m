//
//  Activity.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/11.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "Activity.h"

@implementation Activity
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}
@end
