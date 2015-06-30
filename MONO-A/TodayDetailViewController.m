//
//  TodayDetailViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TodayDetailViewController.h"

@interface TodayDetailViewController ()<NetWorkEngineDelegate>
@property (nonatomic , retain) NSString *webStr;
@property (nonatomic , retain) UIWebView *web;


@end

@implementation TodayDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getDataFromNet];
    
    self.web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_web];
    
    
    self.backBtn = [UIButton buttonWithType:1];
    self.backBtn.backgroundColor = [UIColor clearColor];
    self.backBtn.frame = CGRectMake(30, self.view.frame.size.height - 70, 50, 50);
    self.backBtn.layer.cornerRadius = 25;
    self.backBtn.layer.masksToBounds = YES;
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBtn];
    [self.backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    
    // Do any additional setup after loading the view.
}

- (void)backBtnAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)getDataFromNet
{
    NetWorkEngine *net = [NetWorkEngine engineWithURL:[NSURL URLWithString:self.todayDatailURL] parameters:nil deleagte:self];
    [net start];
}

- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *newDic = dic[@"data"];
    NSString *str = newDic[@"content"];
    self.webStr = str;
    [self.web loadHTMLString:self.webStr baseURL:nil];
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

@end
