//
//  MovieDetailViewController.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/10.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Movie.h"
@interface MovieDetailViewController : UIViewController
@property (strong,nonatomic)Movie *movie;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *pubDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *moviwTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieCountryLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;

@end
