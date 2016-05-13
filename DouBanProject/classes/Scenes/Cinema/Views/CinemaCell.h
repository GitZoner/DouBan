//
//  CinemaCell.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/12.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cinema.h"
@interface CinemaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIButton *telNumButton;
@property (strong,nonatomic)Cinema *cinema;


+(CGFloat)calculateCellHeightWithCinema:(Cinema *)cinema;
@end
