//
//  LiangCang1ViewController.m
//  First
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "LiangCang1ViewController.h"

@interface LiangCang1ViewController ()
{
    MBProgressHUD *HUD;
}
@property (nonatomic , retain)UIButton *backBtn;
@end

@implementation LiangCang1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:webView];
    HUD = [[MBProgressHUD alloc]initWithView:webView];
    [webView addSubview:HUD];
    [HUD show:YES];
    NSURL *url = [NSURL URLWithString:self.link];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    [webView loadRequest:request];
    [HUD hide:YES];
    [HUD release];
    [request release];
    [webView release];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)dealloc
{
    [_backBtn release];
    _link  = nil;
    [super dealloc];
}
@end
