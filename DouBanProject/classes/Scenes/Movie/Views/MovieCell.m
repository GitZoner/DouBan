//
//  MovieCell.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

-(void)setMovie:(Movie *)movie {
    if (_movie != movie) {
        _movie = nil;
        _movie = movie;
        self.movieNameLabel.text = _movie.title;
        self.movieStarLabel.text = _movie.stars;
        self.pubDateLabel.text = _movie.pubdate;
    }
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
