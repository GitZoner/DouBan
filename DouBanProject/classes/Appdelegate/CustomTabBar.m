//
//  CustomTabBar.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "CustomTabBar.h"
#import "PublicButton.h"

@interface CustomTabBar  ()
@property (strong,nonatomic)PublicButton *button;
@end

@implementation CustomTabBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _button = [PublicButton createPublishButton];
        [self addSubview:_button];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat barWidth = self.frame.size.width;
    CGFloat barHeight = self.frame.size.height;
    
    CGFloat buttonWidth = barWidth / 5;
    CGFloat buttonHeight = barHeight - 2;
    CGFloat buttonY = 1;
    
    self.button.center = CGPointMake(barWidth / 2, barHeight * 0.3);
    
    NSInteger index = 0;
    for (UIView *view in self.subviews) {
        NSString *viewClass =  NSStringFromClass([view class]);
        if ([viewClass isEqualToString:@"UITabBarButton"]) {
            CGFloat buttonX = index * buttonWidth;
            if (index >= 2) {
                buttonX += buttonWidth;
            }
            view.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
            index++;
        }
    }
}
@end
