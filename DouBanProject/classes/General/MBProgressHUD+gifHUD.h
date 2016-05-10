//
//  MBProgressHUD+gifHUD.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/10.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (gifHUD)

/**
 *  加载 GIF 动画的 HUD 功能
 *
 *  @param frame    HUD 视图的大小
 *  @param gifName  gif 图片的名字
 *  @param view     HUD 显示所在的 view
 */
+(void)setUpHUDWithFrame:(CGRect)frame gifName:(NSString *)gifName andShowToView:(UIView *)view;
@end
