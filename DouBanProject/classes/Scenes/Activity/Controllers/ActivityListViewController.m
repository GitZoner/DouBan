//
//  ActivityListViewController.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ActivityListViewController.h"
#import "ActivityCell.h"
#import "NetWorkRequestManager.h"
#import "Main_marco.h"
#import "Activity.h"
@interface ActivityListViewController ()


@property (strong,nonatomic)NSMutableArray *allActivitiesArray;// 存放所有活动对象的数组
@end

static NSString *const activityCellReuseIdentifier = @"ativityCellID";
@implementation ActivityListViewController

// 懒加载存放所有活动对象的数组
-(NSMutableArray *)allActivitiesArray {
    if (!_allActivitiesArray) {
        _allActivitiesArray = [NSMutableArray new];
        
    }
    return _allActivitiesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 发起网络请求
    [self sendNetRequest];
    
    [self.tableView registerClass:[ActivityCell class] forCellReuseIdentifier:activityCellReuseIdentifier];
}

-(void)sendNetRequest {
    __weak typeof (ActivityListViewController *)activityListVC  = self;
    [NetWorkRequestManager requestType:GET URLString:ACTIVITY_LIST_URL Param:nil Successed:^(id data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        NSArray *eventArray = dict[@"events"];
        for (NSDictionary *dic in eventArray) {
            Activity *activity = [Activity new];
            [activity setValuesForKeysWithDictionary:dic];
            [activityListVC.allActivitiesArray addObject:activity];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [activityListVC.tableView reloadData];
        });
        
    } Failed:^(NSError *error) {
        
    }];
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

    return self.allActivitiesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:activityCellReuseIdentifier forIndexPath:indexPath];
    Activity *activity = self.allActivitiesArray[indexPath.row];
    cell.activity = activity;
    
    cell.selected = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Activity *activity = self.allActivitiesArray[indexPath.row];
    return [[ActivityCell class] getHeightForCellWithActivity:activity];
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
