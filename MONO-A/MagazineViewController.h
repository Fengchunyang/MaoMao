//
//  MagazineViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagazineView.h"


@interface MagazineViewController : UIViewController<NetWorkEngineDelegate>

@property(nonatomic,retain)NSMutableArray * modelArray;
@property(nonatomic,assign)NSInteger num;


@end
