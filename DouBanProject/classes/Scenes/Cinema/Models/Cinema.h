//
//  Cinema.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/12.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cinema : NSObject
@property (nonatomic,retain) NSString * cinemaId;
@property (nonatomic,retain) NSString * cinemaName;
@property (nonatomic,retain) NSString * address;
@property (nonatomic,retain) NSString * trafficRoutes;
@property (nonatomic,retain) NSString * telephone;
@property (nonatomic,retain) NSMutableArray * broadcasts;
@end
