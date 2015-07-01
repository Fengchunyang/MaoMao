//
//  WebViewController.m
//  MONO-B
//
//  Created by 张浩杰 on 15-6-29.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "WebViewController.h"
#import "NetWorkEngine.h"
@interface WebViewController ()
{
    MBProgressHUD *HUD ;
}
@property(nonatomic,retain)UIWebView * webView;
@property (nonatomic , retain)UIButton *backBtn;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:_webView];
    HUD = [[MBProgressHUD alloc]initWithView:self.webView];
    [self.webView.window addSubview:HUD];
    [HUD show:YES];
    if (_linkStr.length > 0) {
        NSURL * url = [NSURL URLWithString:_linkStr];
        NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
        [self.webView loadRequest:request];

    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"对不起，该页面无法打开" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    
    [HUD hide:YES];
    
    [self.webView release];
    [HUD release];
    self.backBtn = [UIButton buttonWithType:1];
    self.backBtn.backgroundColor = [UIColor clearColor];
    self.backBtn.frame = CGRectMake(30, self.view.frame.size.height - 70, 50, 50);
    self.backBtn.layer.cornerRadius = 25;
    self.backBtn.layer.masksToBounds = YES;
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBtn];
    [self.backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)backBtnAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_backBtn release];
    _linkStr =nil;
    [super dealloc];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
