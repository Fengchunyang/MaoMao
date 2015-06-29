//
//  MONONextViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface MONONextViewController : UIViewController

@property (nonatomic , retain)UIWebView *webView1;
@property (nonatomic , assign)NSString *link;
@property (nonatomic , retain)NSIndexPath *indexPath;
@property (nonatomic , retain)NSMutableDictionary *dic;
@property (nonatomic , retain) UIButton *backBtn;

@end
