//
//  Color_marco.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#ifndef Color_marco_h
#define Color_marco_h

// 设置颜色
#define JT_COLOR(r,g,b,a) [UIColor colorWithRed:(r)/ 255.0 green:(g)/ 255.0 blue:(b)/ 255.0 alpha:a]
// 随机颜色
#define JT_RANDOM_COLOR JT_COLOR(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255),1.0)

// 主题颜色
#define THEME_COLOR JT_COLOR(30,170,190,1.0)

#endif /* Color_marco_h */
