//
//  RegisterViewController.m
//  Douban
//
//  Created by 张磊 on 16/5/8.
//  Copyright © 2016年 张磊. All rights reserved.
//

#import "RegisterViewController.h"
#import <AFNetworking.h>
#import "Main_marco.h"

@interface RegisterViewController ()<UITextFieldDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;  //头像
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;    //用户名输入框
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;    //密码输入框
@property (weak, nonatomic) IBOutlet UITextField *repasswordTextField;  //重复密码
@property (nonatomic, strong) UIImagePickerController *imagePicker; //图片选择器

@property (weak, nonatomic) IBOutlet UIButton *registerButton;  //注册按钮

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;  //高约束

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //设置标题
    self.title = @"注册";
    
    self.imagePicker =[[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    
}

#pragma mark --UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    _avatarImageView.image = image;
    
    //
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        // 将相机拍摄的照片存入相册
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(saveImage), nil);
    }
    // 隐藏图片选择界面
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // 隐藏图片选择界面
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveImage{
    NSLog(@"存储照片");
}

/**
 * 点击头像执行此方法
 */
- (IBAction)tapAvatarView:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
       // 指定资源类型（图片的资源类型）
        _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 是否允许编辑
        _imagePicker.allowsEditing = YES;
        // 模态出图片选择器
        [self presentViewController:_imagePicker animated:YES completion:nil];
    }];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imagePicker.allowsEditing = YES;
        // 模态出图片选择器
        [self presentViewController:_imagePicker animated:YES completion:nil];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addAction:photoAction];
    [alert addAction:cameraAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

/**
 * 点击空白处执行此方法
 */
- (IBAction)tapEmpty:(id)sender {

}


/**
 * 点击注册按钮执行此方法
 */
- (IBAction)doRegister:(id)sender {
    __weak typeof (RegisterViewController *)registerViewController = self;
   UIAlertController *alert =  [UIAlertController alertControllerWithTitle:@"提示" message: nil preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        if ([alert.message isEqualToString:@"注册成功"]) {
             [registerViewController.navigationController popViewControllerAnimated:YES];
        }
       
    }];
    [alert addAction:cancelAction];
   
    if([_userNameTextField .text isEqualToString:@""]) {
        alert.message = @"用户名不能为空";
         [self presentViewController:alert animated:YES completion:nil];
        
    }else if ([_passwordTextField.text isEqualToString:@""]) {
        alert.message = @"密码不能为空";
         [self presentViewController:alert animated:YES completion:nil];
    }else if (![_repasswordTextField.text isEqualToString:_passwordTextField.text] ) {
        alert.message = @"两次密码输入不一致";
         [self presentViewController:alert animated:YES completion:nil];
    }else {
        // 发起网路请求，上传用户名和密码和头像
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        // 参数
        NSDictionary *param = @{@"userName":_userNameTextField.text,@"password":_passwordTextField.text};
        [manager POST:USER_REGISTER_URL parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            [formData appendPartWithFileData:UIImageJPEGRepresentation(_avatarImageView.image, 0.2) name:@"avatar" fileName:@"avatar.jpg" mimeType:@"appliction/octet-stream"];
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ([responseObject[@"success"] intValue] == 1) {
                
                    alert.message = @"注册成功";
                
                [self presentViewController:alert animated:YES completion:nil];
                
                
            }else {
                if ([responseObject[@"code"] intValue] == 1002) {
                    alert.message = @"用户名已存在！";
                    [self presentViewController:alert animated:YES completion:nil];
                }else {
                    alert.message = @"注册失败";
                    [self presentViewController:alert animated:YES completion:nil];
                }
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            alert.message = @"请求失败";
            [self presentViewController:alert animated:YES completion:nil];
        }];
        
    }
    
    
    
    
}







#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [_userNameTextField resignFirstResponder] | [_passwordTextField resignFirstResponder] | [_repasswordTextField resignFirstResponder];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
