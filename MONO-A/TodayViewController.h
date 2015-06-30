//
//  TodayViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , retain) UITableView *tableView;
@property (nonatomic , retain) NSString *TodayUrl;

@property (nonatomic , retain) UIButton *backBtn;

@end
