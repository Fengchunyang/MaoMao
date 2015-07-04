//
//  manhuaViewController.h
//  mono
//
//  Created by 张浩杰 on 15-7-2.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetWorkEngine.h"
#import "manhuaDatahadling.h"
#import "PastViewController.h"
@interface manhuaViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,manhuadatahadlingDelegate>

@property(nonatomic,assign)NSInteger num;
@property(nonatomic,retain)NSMutableArray * modelArray;
@property(nonatomic,retain)NSString * string;
@property(nonatomic,retain)PastViewController * pro;
@end
