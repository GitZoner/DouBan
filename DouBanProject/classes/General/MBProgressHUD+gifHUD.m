//
//  MBProgressHUD+gifHUD.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/10.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "MBProgressHUD+gifHUD.h"
#import <SDWebImage/UIImage+GIF.h>
#import "Color_marco.h"
@implementation MBProgressHUD (gifHUD)


+(void)setUpHUDWithFrame:(CGRect)frame gifName:(NSString *)gifName andShowToView:(UIView *)view {
    // 通过 SDWebImage 第三方将一个 gif 格式的图片转成 UIImage 对象；
    UIImage *image = [UIImage sd_animatedGIFNamed:gifName];
    // 将要显示的 gif 对象添加到一个 ImageView 视图上
    UIImageView *gifView = [[UIImageView alloc] initWithFrame:frame];
    gifView.image = image;
    
    
    MBProgressHUD *hud = [self showHUDAddedTo:view animated:YES];
    hud.color = JT_COLOR(0, 0, 0, 0.2);
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = @"正在加载...";
    hud.customView = gifView;
    
    
    
}
@end
