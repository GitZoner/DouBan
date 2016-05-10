//
//  ActivityCell.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/10.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ActivityCell.h"
#import "Color_marco.h"
#import <Masonry.h>
#define kLeftSpace 10       //左边距
#define kRightSpace 10      //右边距
#define kTopSpace 10 //上边距
#define kBottomSpace 10 //下边距
#define kTitleHeight 30     //标题高
#define kVerticalSpace 10    //控件之间的垂直间距
#define kHorizontalSpace 5  //控件之间的水平间距
#define kIconSize CGSizeMake(16, 16)    //图标控件的尺寸
#define kInterestHeight 15 //感兴趣标签高度
#define kActivityImageSize CGSizeMake(88, 130) //活动图片尺寸


#define kTimeLabelWidth [UIScreen mainScreen].bounds.size.width - kLeftSpace - kRightSpace - kIconSize.width - kHorizontalSpace * 2 - kActivityImageSize.width  //时间标签的宽


@interface ActivityCell ()
// 标题
@property (strong,nonatomic)UILabel *titleLabel;

@end
@implementation ActivityCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addAllSubviews];
    }
    return self;
}

#pragma mark -添加 cell 上的子视图
-(void)addAllSubviews{
    // 添加背景视图
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor colorWithRed:0.8761 green:1.0 blue:0.844 alpha:1.0];
    
    // 先添加到父视图上，在给视图添加约束
    [self.contentView addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        __weak typeof (ActivityCell *) cell = self;
        
        // 距离 contentView 的上左下右都为0
        make.top.equalTo(cell.contentView);
        make.left.equalTo(cell.contentView);
        make.bottom.equalTo(cell.contentView);
        make.right.equalTo(cell.contentView);
        
    }];
    
    // 添加标题
    self.titleLabel = [UILabel new];
    self.titleLabel.backgroundColor = [UIColor colorWithRed:1.0 green:0.4 blue:0.4 alpha:1.0];
    [backView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top).offset(kTopSpace);
        make.left.equalTo(backView.mas_left).offset(kLeftSpace);
        make.height.equalTo(@(kTitleHeight));
        make.right.equalTo(backView.mas_right).offset(-kRightSpace);
    }];
    
}













@end
