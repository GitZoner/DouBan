//
//  MovieListViewController.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "MovieListViewController.h"
#import "NetWorkRequestManager.h"
#import "Main_marco.h"
#import "Movie.h"
#import "MovieCell.h"
#import "MovieDetailViewController.h"


@interface MovieListViewController ()

// 存放所有的电影
@property (strong,nonatomic)NSMutableArray *allMovieArray;

@end
//static NSString * const MovieCellReuseIdentifier = @"MovieCellReuseIdentifierID";
@implementation MovieListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 进行网络请求
    [self requestData];
    // 注册 cell
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCellReuseIdentifierID"];
   
}

-(void)requestData {
    
    
    __weak typeof (self) movieTVC = self;

    
    [NetWorkRequestManager requestType:GET URLString:MOVIE_LIST_URL Param:nil Successed:^(id data) {
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
       
        //  判断字典里有多少条数据
        if ([dic[@"total"] intValue] != 0) {
            NSArray *allDataArray = dic[@"entries"];
            for (NSDictionary *dict in allDataArray) {
                Movie *movie = [Movie new];
                [movie setValuesForKeysWithDictionary:dict];
                [movieTVC.allMovieArray addObject:movie];
               
            }
            
            [_allMovieArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                Movie *movie1 = (Movie *)obj1;
                Movie *movie2 = (Movie *)obj2;
                return [movie2.pubdate compare:movie1.pubdate];
            }];
        }
       
        dispatch_async(dispatch_get_main_queue(), ^{
           // 数据解析和排序完成后，刷新页面
            
            [movieTVC updateDataForUI];
        });
    } Failed:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(void)updateDataForUI {
    
    [self.tableView reloadData];
}

/**
 *  使用懒加载方式初始化数组
 */
-(NSMutableArray *)allMovieArray {
    if (!_allMovieArray) {
        _allMovieArray = [NSMutableArray array];
        
    }
    return _allMovieArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.allMovieArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell  *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MovieCellReuseIdentifierID" forIndexPath:indexPath];
    // 设置 cell 显示的内容
    Movie *movie = self.allMovieArray[indexPath.row];
    cell.movie = movie;
    if (movie.image != nil) {
        cell.movieImageView.image = movie.image;
    }else {
        [movie loadImage];
        // 使用 KVO 添加监听事件
        [movie addObserver:self forKeyPath:@"image" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:(void *)CFBridgingRetain(indexPath)];
        
    }
    
    return cell;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    // 获取图片
    UIImage *image = change[NSKeyValueChangeNewKey];
    // 获取 cell 的位置
    NSIndexPath *indexPath = (__bridge NSIndexPath *)(context);
    // 获取所有正在显示的 cell 的位置
    NSArray *indexPathArray  = [self.tableView indexPathsForVisibleRows];
    
    if ([indexPathArray containsObject:indexPath]) {
        // 获取当前 cell
        MovieCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.movieImageView.image = image;
        //[self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationAutomatic)];
    }
    
    CFBridgingRelease((__bridge CFTypeRef _Nullable)(indexPath));
    [object removeObserver:self forKeyPath:@"image" context:context];

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieDetailViewController  *movieDetailVC = [MovieDetailViewController new];
    Movie *movie = self.allMovieArray[indexPath.row];
    movieDetailVC.movie = movie;
    [self.navigationController pushViewController:movieDetailVC animated:YES];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
