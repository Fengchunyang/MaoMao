//
//  TeaViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeaView.h"

@interface TeaViewController : UIViewController

@property (nonatomic , retain) TeaView *teaView;
@property (nonatomic , retain) UITableView *tableView;
@property (nonatomic , retain) NSArray *arr;

@end
