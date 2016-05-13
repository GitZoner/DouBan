//
//  CinemaMapViewController.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/12.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "CinemaMapViewController.h"

@interface CinemaMapViewController ()<BMKMapViewDelegate,BMKGeoCodeSearchDelegate,BMKPoiSearchDelegate,UITextFieldDelegate>
@property (strong,nonatomic)BMKGeoCodeSearch *geoCodeSearch;// 地理编码搜索
@property (strong,nonatomic)UITextField *searchTextField;
@property (strong,nonatomic)UIButton *searchButton;
@property (strong,nonatomic)UIView *searchView;
@property (strong,nonatomic)BMKPoiSearch *poiSearch;

@end

@implementation CinemaMapViewController

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mapView setZoomEnabled:YES];// 设置地图能否缩放，默认是 yes
    [self.mapView setZoomLevel:17];// 设置缩放级别
   
    // 检索对象
    _geoCodeSearch = [[BMKGeoCodeSearch alloc]init];
     _geoCodeSearch.delegate = self;
    // 检索（检索的内容）
    BMKGeoCodeSearchOption *option = [[BMKGeoCodeSearchOption alloc] init];
    option.address = _cinema.address;
    NSLog(@"option.address:%@",option.address);
    BOOL flag = [_geoCodeSearch geoCode:option];
    if (flag) {
        NSLog(@"检索成功");
        
    }else {
        NSLog(@"检索失败");
    }
    
    [self addSearchView];
    self.poiSearch = [[BMKPoiSearch alloc] init];
    self.poiSearch.delegate = self;
}

#pragma mark - 添加搜索视图
-(void)addSearchView {
    
    self.searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 10, 300, 30)];
    self.searchTextField.backgroundColor = [UIColor whiteColor];
    self.searchTextField.placeholder = @"请输入要搜索的内容";
    self.searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.navigationItem.titleView = self.searchTextField;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"search" style:(UIBarButtonItemStylePlain) target:self action:@selector(searchAction)];
    
    
    
    
}

-(void)searchAction {
    BMKCitySearchOption *option = [[BMKCitySearchOption alloc] init];
    option.keyword = self.searchTextField.text;
    option.pageIndex = 0;
    option.pageCapacity = 50;
    option.city = @"北京市";
    bool flag = [self.poiSearch poiSearchInCity:option];
    if (flag) {
        NSLog(@"城市搜索成功");
    }else {
        NSLog(@"城市内搜索失败");
    }
    
}

#pragma mark -检索结果的回调
-(void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {
    
    // 获取地图上已有的大头针
    NSArray *array = [NSArray arrayWithArray:_mapView.annotations];
    // 清空地图已有的大头针
    [_mapView removeAnnotations:array];
    // 获取地图上已有的辅助图层
    array = [NSArray arrayWithArray:_mapView.overlays];
    // 移除已有的辅助图层
    [_mapView removeOverlays:array];
    /**
     *  @author Jason, 16-05-12 17:05:33
     *
     *  @brief Annotation在 MVC 中相当于 M，存储了大头针的相关信息
     *
     *  @since
     */
    
    BMKPointAnnotation *pointAnnotation = [BMKPointAnnotation new];
    pointAnnotation.coordinate = result.location;
    
    pointAnnotation.title = result.address;
    
    [self.mapView addAnnotation:pointAnnotation];
    
    // 地图视图的中心点设置到搜索的位置
    _mapView.centerCoordinate = result.location;
    
    
}
#pragma mark - POI搜索回调
-(void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult *)poiResult errorCode:(BMKSearchErrorCode)errorCode {
    NSArray *array = poiResult.poiInfoList;
    for (BMKPoiInfo *poiInfo in array) {
        BMKPointAnnotation *pointAnnotation = [BMKPointAnnotation new];
        pointAnnotation.coordinate = poiInfo.pt;
        
        pointAnnotation.title = [NSString stringWithFormat:@"%d--%@",poiInfo.epoitype,poiInfo.name];
        
        [self.mapView addAnnotation:pointAnnotation];
    }
    
    
    
    
}
#pragma mark -绘制大头针
// 根据 annotation 绘制大头针,该方法相当于 Tableview 中的 cellforRow 代理方法
-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
     NSString *annotationID = @"annotationID";
    // 根据指定标识在重用池中查找可以复用的 annotation
    BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationID"];
    if (!annotationView) {
        annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationID];
        ((BMKPinAnnotationView *)annotationView).pinColor = BMKPinAnnotationColorPurple;
        ((BMKPinAnnotationView *)annotationView).animatesDrop = YES;
        
    }
    annotationView.centerOffset = CGPointMake(0, 10);
    annotationView.annotation = annotation;
    annotationView.canShowCallout = YES;
    
    return annotationView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
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
