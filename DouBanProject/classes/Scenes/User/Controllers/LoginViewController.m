//
//  LoginViewController.m
//  Douban
//
//  Created by 张磊 on 16/5/6.
//  Copyright © 2016年 张磊. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import <AFNetworking.h>
#import "Main_marco.h"
#import "User.h"
#import "FileHandle.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;//用户名输入框
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;    //密码输入框
@property (weak, nonatomic) IBOutlet UIButton *loginButton; //登录按钮
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;  //高约束


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //设置标题
    self.title = @"登录";
    
    //添加取消按钮
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    button.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = button;

}

/**
 * 取消登录
 */
- (void)cancel{
    //隐藏登录页面
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

/**
 * 点击去注册按钮执行此方法
 * @param sender
 */
- (IBAction)goToRegister:(id)sender {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

/**
 * 点登录按钮执行此方法
 * @param sender
 */
- (IBAction)login:(id)sender {
    __weak typeof (LoginViewController *)loginViewController = self;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        if ([alert.message isEqualToString: @"登陆成功"]) {
            [loginViewController.navigationController popViewControllerAnimated:YES];
        }
    }];
    [alert addAction:cancelAction];
    // 判断用户名是否为空
    if (nil == _userNameTextField.text || nil == _passwordTextField.text) {
        alert.message =@"用户名或密码不能为空";
        [self presentViewController:alert animated:YES completion:nil];
    }else {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        // 设置参数
        NSDictionary *dicParam = @{@"userName":_userNameTextField.text,@"password":_passwordTextField.text};
        [manager POST:USER_LOGIN_URL parameters:dicParam constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 如果不知道 responserObject 的情况下，要判断
            NSLog(@"%@",responseObject);
            // 解析结果
            if ([responseObject[@"success"] intValue] == 1) {
                
                
             
                    User *user = [User new];
                    
                    
                    NSDictionary *dict = responseObject[@"data"];
                    [user setValuesForKeysWithDictionary:dict];
                    
                    user.userName = _userNameTextField.text;
                    user.password = _passwordTextField.text;
                    user.loginState = YES;

                    [FileHandle saveUserInfo:user];
                    // 登陆成功后，调用 block 将用户信息传到登陆前的界面
                    _completion(user);
                    alert.message =@"登陆成功";
                    
                    
                    
                    
                     [loginViewController presentViewController:alert animated:YES completion:nil];
          
                
            }else {
                if ([responseObject[@"code"] intValue] == 1102) {
                        alert.message = @"用户名或密码错误";
                        NSError *error = [NSError errorWithDomain:@"用户名或密码错误" code:[responseObject[@"code"] intValue] userInfo:@{@"requestType":@"Login"}];
                        [loginViewController presentViewController:alert animated:YES completion:nil];
                }
            }
                
         
                
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            alert.message = @"请求失败";
            [loginViewController presentViewController:alert animated:YES completion:nil];
        }];
        
    }

}

/**
 * 点击空白处执行此方法
 */
- (IBAction)tapEmpty:(id)sender {
   //键盘回收
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFeld Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //键盘回收
    return [_passwordTextField resignFirstResponder] | [_userNameTextField resignFirstResponder];
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
