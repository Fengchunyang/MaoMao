//
//  TodayTableViewCell.h
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodayModel.h"

@interface TodayTableViewCell : UITableViewCell

@property (nonatomic , retain) UIImageView *topImageView;
@property (nonatomic , retain) UIImageView *smallImageView;
@property (nonatomic , retain) UILabel *title;
@property (nonatomic , retain) UILabel *leftLabel;

@property (nonatomic , retain) TodayModel *todayModel;


@end
