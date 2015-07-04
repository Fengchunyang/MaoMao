//
//  PastViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data handling.h"
#import "ProgramView1.h"
@class Data_handling;
@interface PastViewController : UIViewController<DatahandlingDelegate, UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,retain)Data_handling * handling;
@property(nonatomic,retain)ProgramView1 * prograView;
@property(nonatomic,retain)NSMutableArray * array;//接收model

@end
