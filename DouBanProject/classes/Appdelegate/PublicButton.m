//
//  PublicButton.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "PublicButton.h"

@implementation PublicButton

// 重写父类的初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


// 类方法
+(instancetype)createPublishButton {
    PublicButton *button = [PublicButton new];
    // 设置按钮的图片
    [button setImage:[UIImage imageNamed:@"post_normal"] forState:(UIControlStateNormal)];
    // 设置按钮的文字
    [button setTitle:@"发布" forState:(UIControlStateNormal)];
    // 设置 button 文字的颜色
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:9.5];
    [button sizeToFit];
    
    // 添加事件
    [button addTarget:button action:@selector(clickPulishButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    return button;

    
}


// 点击事件
-(void)clickPulishButtonAction {
    NSLog(@"点击了中间按钮");
}

// 将 button上的 image 和 titleLabel 进行上下结构的调整
-(void)layoutSubviews {
    [super layoutSubviews];
    // 设置控件大小，间距
    CGFloat imageViewSize = self.bounds.size.width * 0.6;
    CGFloat center = self.bounds.size.width  * 0.5;
    // 设置 imageView和 Label 的间距
    // 获取 Label 的高度
    CGFloat labelHeight = self.titleLabel.font.lineHeight;
    CGFloat verticalMargin = (self.bounds.size.height - labelHeight - imageViewSize) / 2.0;
    // 设置 imageView 和 titleLabel 中心的 Y 值
    CGFloat centerYOfImageView = verticalMargin + imageViewSize * 0.5;
    CGFloat centerYOfTitleLabel = verticalMargin + imageViewSize + labelHeight * 0.5;
    
    // 确认最终位置
    self.imageView.bounds = CGRectMake(0, 0, imageViewSize, imageViewSize);
    self.imageView.center = CGPointMake(center, centerYOfImageView);
//    self.titleLabel.bounds = CGRectMake(0, 0, <#CGFloat width#>, <#CGFloat height#>)
    self.titleLabel.center = CGPointMake(center, centerYOfTitleLabel);
    
    
    
    
}
@end
