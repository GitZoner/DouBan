//
//  CinemaMapViewController.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/12.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import "Cinema.h"
@interface CinemaMapViewController : UIViewController
@property (weak, nonatomic) IBOutlet BMKMapView *mapView;
@property (strong,nonatomic)Cinema *cinema;
@end
