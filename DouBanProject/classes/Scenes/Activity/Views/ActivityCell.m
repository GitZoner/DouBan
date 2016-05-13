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
#import <UIImageView+WebCache.h>
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
// 时间图标
@property (strong,nonatomic)UIImageView *timeImageView;
// 时间标签
@property (strong,nonatomic)UILabel *timeLabel;
// 活动图片
@property (strong,nonatomic)UIImageView *activityImageView;
// 地点图标
@property (strong,nonatomic)UIImageView *locationImageView;
// 地点标题
@property (strong,nonatomic)UILabel *locationLabel;
// 类型图标
@property (strong,nonatomic)UIImageView *typeImageView;
// 类型标签
@property (strong,nonatomic)UILabel *typeLabel;
// 感兴趣标签
@property (strong,nonatomic)UILabel *interestNumberLabel;
// 参加人数的标签
@property (strong,nonatomic)UILabel *joinNumberLabel;

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
     __weak typeof (ActivityCell *) cell = self;
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        
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
        // TODO:
    }];
    
    // 设置时间图标
    self.timeImageView = [UIImageView new];
    self.timeImageView.image = [UIImage imageNamed:@"icon_date_blue"];
    [backView addSubview:self.timeImageView];
    [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(kIconSize);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kVerticalSpace);
        make.left.equalTo(self.titleLabel.mas_left);
        
    }];
    
    // 活动图片
    self.activityImageView =[UIImageView new];
    self.activityImageView.backgroundColor = [UIColor colorWithRed:1.0 green:0.4 blue:0.4 alpha:1.0];
    [backView addSubview:self.activityImageView];
    [self.activityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(kActivityImageSize);
        make.top.equalTo(cell.titleLabel.mas_bottom).offset(kVerticalSpace);
        make.right.equalTo(cell.titleLabel.mas_right);
        
        
    }];
    // 上映时间标签
    self.timeLabel = [UILabel new];
    self.timeLabel.backgroundColor = [UIColor colorWithRed:1.0 green:0.4 blue:0.4 alpha:1.0];
    self.timeLabel.numberOfLines = 0;
    [backView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.timeImageView.mas_top);
        make.left.equalTo(cell.timeImageView.mas_right).offset(kHorizontalSpace);
        make.right.equalTo(cell.activityImageView.mas_left).offset(-kHorizontalSpace);
        //TODO:dffgb
       
        
    }];
    
    // 地点图标
    self.locationImageView = [UIImageView new];
    
    self.locationImageView.image = [UIImage imageNamed:@"icon_spot_blue"];
    [backView addSubview:self.locationImageView];
    [self.locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.timeLabel.mas_bottom).offset(kVerticalSpace);
        make.left.equalTo(cell.timeImageView.mas_left);
        make.size.mas_equalTo(kIconSize);
    }];
    
    // 地点标题
    self.locationLabel = [UILabel new];
    self.locationLabel.backgroundColor = [UIColor colorWithRed:1.0 green:0.4 blue:0.4 alpha:1.0];
    self.locationLabel.numberOfLines = 0;
    [backView addSubview:self.locationLabel];
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.locationImageView.mas_right).offset(kHorizontalSpace);
        make.top.equalTo(cell.timeLabel.mas_bottom).offset(kVerticalSpace);
        make.right.equalTo(cell.activityImageView.mas_left).offset(-kHorizontalSpace);
        make.width.equalTo(cell.timeLabel.mas_width);
      
    }];
    // 类型图标
    self.typeImageView = [UIImageView new];
    
    self.typeImageView.image=[UIImage imageNamed:@"icon_catalog_blue"];
    [backView addSubview:self.typeImageView];
    [self.typeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.locationLabel.mas_bottom).offset(kVerticalSpace);
        make.left.equalTo(cell.locationImageView.mas_left);
        make.size.mas_equalTo(kIconSize);
    }];
    
    // 类型标签
    self.typeLabel = [UILabel new];
    self.typeLabel.backgroundColor = [UIColor colorWithRed:1.0 green:0.4 blue:0.4 alpha:1.0];
    self.typeLabel.numberOfLines = 0;
    [backView addSubview:self.typeLabel];
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.locationLabel.mas_bottom).offset(kVerticalSpace);
        make.left.equalTo(cell.typeImageView.mas_right).offset(kHorizontalSpace);
        make.right.equalTo(cell.activityImageView.mas_left).offset(-kHorizontalSpace);
        make.width.equalTo(cell.locationLabel.mas_width);
        
    }];
    // 感兴趣标签
    self.interestNumberLabel = [UILabel new];
    self.interestNumberLabel.backgroundColor = [UIColor colorWithRed:1.0 green:0.4 blue:0.4 alpha:1.0];
    [backView addSubview:self.interestNumberLabel];
    [self.interestNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.typeLabel.mas_bottom).offset(kVerticalSpace);
        make.left.equalTo(cell.typeLabel.mas_left);
        make.height.mas_equalTo(kInterestHeight);
        make.width.equalTo(cell.typeLabel.mas_width).multipliedBy(0.4);
    }];
    // 参加人数标签
    self.joinNumberLabel = [UILabel new];
    [self.joinNumberLabel setBackgroundColor:[UIColor colorWithRed:1.0 green:0.4 blue:0.4 alpha:1.0]];
    [backView addSubview:self.joinNumberLabel];
    [self.joinNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.interestNumberLabel.mas_top);
        make.left.equalTo(cell.interestNumberLabel.mas_right).offset(2 * kHorizontalSpace);
        make.height.mas_equalTo(kInterestHeight);
        make.right.equalTo(cell.activityImageView.mas_left).offset(-kHorizontalSpace);
        
    }];
}


#pragma mark -实现 cell 的自适应
+(CGFloat)getHeightForCellWithActivity:(Activity *)activity {
    CGSize size = CGSizeMake(kTimeLabelWidth, 100000);
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    
    // 计算 timelabel 的高度
    NSString *timeLabelString = [NSString stringWithFormat:@"%@--%@",activity.begin_time,activity.end_time ];
    CGRect timeRect =[timeLabelString boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:dict context:nil];
    // 计算 locationLabel的高度
    CGRect locationRect = [activity.address boundingRectWithSize:size options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:dict context:nil];
    // 计算 typeLabel的高度
    CGRect typeLabelRect = [activity.category_name boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:dict context:nil];
    return typeLabelRect.size.height + locationRect.size.height + timeRect.size.height + 6 * kVerticalSpace + kTitleHeight + kInterestHeight + 30;
}



-(void)setActivity:(Activity *)activity {
    if (_activity != activity) {
        _activity = nil;
        _activity = activity;
        _titleLabel.text = activity.title;
        _timeLabel.text = [NSString stringWithFormat:@"%@--%@",activity.begin_time,activity.end_time];
        _locationLabel.text = activity.address;
        _typeLabel.text = activity.category_name;
        _interestNumberLabel.text = [NSString stringWithFormat:@"感兴趣：%@",[@(activity.wisher_count) stringValue] ];
        _joinNumberLabel.text = [NSString stringWithFormat:@"参加：%@",[@(activity.participant_count) stringValue]];
        [_activityImageView sd_setImageWithURL:[NSURL URLWithString:activity.image] placeholderImage:[UIImage imageNamed:@"picholder"]];
    }
}







@end
