//
//  MONOViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MONOVIew.h"

@interface MONOViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>
@property (nonatomic , retain)UITableView *tableView;
@property (nonatomic , retain)NSDictionary *bigDic;
@property (nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)ThirdPageModelCell *PageCell;
@property (nonatomic , retain)ThirdModelCell *ModelCell;

//@property (nonatomic , retain) MONOVIew *monoView;


@end
