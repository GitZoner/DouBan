//
//  Main_marco.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#ifndef Main_marco_h
#define Main_marco_h

// 活动列表 URL
#define ACTIVITY_LIST_URL @"http://api.douban.com/v2/event/list?type=all&district=all&loc=108288&photo_cate=image&photo_count=5&start=0&day_type=future&apikey=062bcf31694a52d212836d943bdef876"
// 电影列表
#define MOVIE_LIST_URL (@"http://api.douban.com/v2/movie/nowplaying?app_name=doubanmovie&client=e:iPhone4,1%7Cy:iPhoneOS_6.1%7Cs:mobile%7Cf:doubanmovie_2%7Cv:3.3.1%7Cm:PP_market%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&city=%E5%8C%97%E4%BA%ACversion=2&start=0&apikey=0df993c66c0c636e29ecbb5344252a4a")
// 电影详情
#define MOVIE_INFO_URL_1 @"http://api.douban.com/v2/movie/subject/"
// 中间拼接id值
#define MOVIE_INFO_URL_2 @"?apikey=0df993c66c0c636e29ecbb5344252a4a&client=e:iPhone4,1%7Cy:iPhoneOS_6.1%7Cs:mobile%7Cf:doubanmovie_2%7Cv:3.3.1%7Cm:PP_market%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&city=%E5%8C%97%E4%BA%AC&version=2&app_name=doubanmovie"

#pragma mark ——————影院列表————————
#define CinemaListAPI  @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/cinemalist.php"

//注册URL

#define USER_REGISTER_URL @"http://162.211.125.85/douban/user.php/DRegister"



//登录URL

#define USER_LOGIN_URL @"http://162.211.125.85/douban/user.php/DLogin"



//头像根路径

#define USER_AVATAR_LOCAL_URL @"http://162.211.125.85"







#endif /* Main_marco_h */
