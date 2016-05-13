//
//  UserViewController.m
//  Douban
//
//  Created by 张磊 on 16/5/4.
//  Copyright © 2016年 张磊. All rights reserved.
//

#import "UserViewController.h"
#import "LoginViewController.h"
#import <UIImageView+WebCache.h>
#import "FileHandle.h"
#import "LoginViewController.h"
#import <UIImageView+WebCache.h>
#import "Main_marco.h"
@interface UserViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;  //头像
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;     //用户名
@property (nonatomic, copy) NSArray *items;
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = @[@"我的活动",  @"我的电影", @"清除缓存"];
    // 添加注销按钮
    NSString *title = nil;
    if ([FileHandle getUserInfo].loginState == YES) {
        title = @"注销";
        [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",USER_AVATAR_LOCAL_URL,[FileHandle getUserInfo].avater ]]placeholderImage:[UIImage imageNamed:@"DefaultAvatar"]];
        _userNameLabel.text = [FileHandle getUserInfo].userName;
        
    }else {
        title = @"登陆";
    }
    //添加注销按钮
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    self.navigationItem.rightBarButtonItem = cancelButton;
      self.navigationController.navigationBar.tintColor = [UIColor blackColor];
  
    
    
}

/**
 * 点击注销按钮执行此方法
 * @param BarButton
 */
- (void)cancel:(UIBarButtonItem *)barButton{
    __weak typeof (UserViewController *)userVC  =self;
    
    if ([barButton.title isEqualToString:@"注销"]) {
        [FileHandle removeUserInfo];
        _userNameLabel.text = @"未登录";
        barButton.title = @"登陆";
        _avatarImageView.image = [UIImage imageNamed:@"DefaultAvatar"];
        
    }else {
        
        LoginViewController *loginVC = [LoginViewController new];
        loginVC.completion = ^(User * user) {
            [userVC.avatarImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",USER_AVATAR_LOCAL_URL,user.avater]] placeholderImage:[UIImage imageNamed:@"DefaultAvatar"]];
            _userNameLabel.text = user.userName;
            barButton.title = @"注销";
            
        };
        [self.navigationController pushViewController:loginVC animated:YES];
    }
    
}
/**
 * 点击头视图执行此方法
 */
- (IBAction)tapHeaderVIew:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _items[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
