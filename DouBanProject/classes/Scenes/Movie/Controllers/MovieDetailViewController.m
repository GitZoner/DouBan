//
//  MovieDetailViewController.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/10.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "NetWorkRequestManager.h"
#import "Main_marco.h"
#import "ImageDownloader.h"

@interface MovieDetailViewController ()<ImageDownloaderDelegate>

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 请求数据
    [self sendRequestGetData];
    
    
    
}

-(void)sendRequestGetData {
    __weak typeof (MovieDetailViewController *) movieDetailVC = self;
    // 拼接网址
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@",MOVIE_INFO_URL_1,_movie.ID,MOVIE_INFO_URL_2];
    [NetWorkRequestManager requestType:GET URLString:urlString Param:nil Successed:^(id data) {
       // 解析数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        // 直接转成 model
        Movie *movie = [Movie new];
        [movie setValuesForKeysWithDictionary:dict];
        // 进行显示
        dispatch_async(dispatch_get_main_queue(), ^{
           // 将数据显示在 UI 上
            [movieDetailVC showInfoToSubViews:movie];
        });
    } Failed:^(NSError *error) {
        
    }];
    
}

-(void)showInfoToSubViews:(Movie *)movie {
    // 赋值
    // 现在需要的图片
    [ImageDownloader ImageDownloaderWithImageUrlString:movie.images[@"large"] delegate:self];
    // 给几个 Label 赋值
    _gradeLabel.text = [NSString stringWithFormat:@"评分：%@ (%@评论)",movie.rating[@"average"],movie.comments_count];
    _pubDateLabel.text = movie.pubdate;
    _moviwTimeLabel.text = [self getStringWithArray:movie.durations];
    _movieTypeLabel.text = [self getStringWithArray:movie.genres];
    _movieCountryLabel.text = [self getStringWithArray:movie.countries];
    _summaryLabel.text = movie.summary;
    
    CGRect frme = _summaryLabel.frame;
    frme.size.height = [self calculateTextHeightWithMovie:movie];
    _summaryLabel.frame = frme;
    // 设置 contentView 的高度
    CGSize size = CGSizeMake(_scrollView.frame.size.width, 190 + _summaryLabel.frame.size.height);
    _contentView.frame = CGRectMake(0, 0, size.width, size.height);
    self.contentViewHeight.constant = size.height + 20;

}

#pragma mark --ImageDownloaderDelegate
-(void)imageDownloader:(ImageDownloader *)imageDownloader didFinishedLoading:(UIImage *)image {
    self.movieImageView.image = image;
}


#pragma mark -数组转化为字符串
-(NSString *)getStringWithArray:(NSArray *)array {
    NSMutableString *string = [NSMutableString new];
    for (NSString *obj in array) {
        [string appendFormat:@"%@ ",obj];
        
    }
    return string;
}

#pragma mark - 计算文本高度
-(CGFloat)calculateTextHeightWithMovie:(Movie *)movie {
    
    CGSize size = CGSizeMake(_summaryLabel.frame.size.width, 10000);
#warning 字体属性值的设置，课下复习
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:24.0f]};
    CGRect rect = [movie.summary boundingRectWithSize:size options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:dict context:nil];
    return rect.size.height;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
