//
//  Cinema.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/12.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "Cinema.h"

@implementation Cinema
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.cinemaId = value;
    }
}
@end
