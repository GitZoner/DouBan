//
//  CinemaListViewController.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "CinemaListViewController.h"
#import "NetWorkRequestManager.h"
#import "Cinema.h"
#import "Main_marco.h"
#import "CinemaCell.h"
#import "CinemaMapViewController.h"
@interface CinemaListViewController ()
@property (strong,nonatomic)NSMutableArray *allCinemasArray;
@end

@implementation CinemaListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
    [self.tableView registerNib:[UINib nibWithNibName:@"CinemaCell" bundle:nil] forCellReuseIdentifier:@"CinemaCellID"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSMutableArray *)allCinemasArray {
    if (!_allCinemasArray) {
        _allCinemasArray = [NSMutableArray new];
    }
    return _allCinemasArray;
}

-(void )requestData {
    __weak typeof (CinemaListViewController *)cinemaVC = self;
    [NetWorkRequestManager requestType:GET URLString:CinemaListAPI Param:nil Successed:^(id data) {
       // 解析数据
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        NSDictionary *resultDic = dic[@"result"];
        NSArray *sourceArray = resultDic[@"data"];
        for (NSDictionary *dict in sourceArray) {
            Cinema *cinema = [Cinema new];
            [cinema setValuesForKeysWithDictionary:dict];
            [cinemaVC.allCinemasArray addObject:cinema];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [cinemaVC.tableView reloadData];
        });
        
    } Failed:^(NSError *error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.allCinemasArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaCellID" forIndexPath:indexPath];
    Cinema *cinema = self.allCinemasArray[indexPath.row];
    cell.cinema = cinema;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Cinema *cinema = self.allCinemasArray [indexPath.row];
    return [[CinemaCell class] calculateCellHeightWithCinema:cinema];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Cinema *cinema = self.allCinemasArray[indexPath.row];
    
    CinemaMapViewController *cinemaMapVC  = [CinemaMapViewController new];
    cinemaMapVC.cinema = cinema;
    NSLog(@"%@",cinema.address);
    [self.navigationController pushViewController:cinemaMapVC animated:YES];
    
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
