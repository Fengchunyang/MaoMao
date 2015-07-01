//
//  CreatorViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZaoWuZhuModelCell.h"
#import "ZaoWuZhuDataModel.h"
#import "ZaoWuZhu1ViewController.h"
#import "ZaoWuZhu2ViewController.h"
#import "LiangCangViewController.h"
#import "JianDanViewController.h"
#import "HuaBaoViewController.h"
#import "WangyiViewController.h"
#import "YingXiangViewController.h"
@interface CreatorViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>

@property(nonatomic , retain)UITableView *tableView;
@property (nonatomic , retain)NSArray *imageArr;
@property (nonatomic , retain)NSArray *nameArr;

@property (nonatomic , retain)NSArray *introArr;

@end
