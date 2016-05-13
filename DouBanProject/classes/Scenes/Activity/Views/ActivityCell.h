//
//  ActivityCell.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/10.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
@interface ActivityCell : UITableViewCell

+(CGFloat)getHeightForCellWithActivity:(Activity *)activity;
@property (strong,nonatomic)Activity *activity;
@end
