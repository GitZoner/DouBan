//
//  CinemaCell.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/12.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "CinemaCell.h"
#define kAddressLabelWidth
@implementation CinemaCell
-(void)setCinema:(Cinema *)cinema {
    if (_cinema != cinema) {
        _cinema = nil;
        _cinema = cinema;
        self.nameLabel.text = cinema.cinemaName;
        self.addressLabel.text = cinema.address;
      
        [self.telNumButton setTitle:cinema.telephone forState:(UIControlStateNormal)];
        // 重新布局
    }
}

+(CGFloat)calculateCellHeightWithCinema:(Cinema *)cinema {
    CGFloat staticHeight  = 20 + 30 + 10 + 10 + 10 + 30;
    CGFloat dynamicHeight = staticHeight + [[self class] calculateLabelHeightWithCinema:cinema];
    return dynamicHeight;
}

+(CGFloat)calculateLabelHeightWithCinema:(Cinema *)cinema {
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, 1000000);
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGRect rect = [cinema.address boundingRectWithSize:size options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:dict context:nil];
    return rect.size.height;
    
}
- (IBAction)telNumButtonAction:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.telNumButton.titleLabel.text]]];
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
