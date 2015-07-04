//
//  detainmanhuaViewController.m
//  mono
//
//  Created by 张浩杰 on 15-7-3.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "detainmanhuaViewController.h"

@interface detainmanhuaViewController ()

@property(nonatomic,retain)UIWebView * webview;

@end

@implementation detainmanhuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.webview = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSURL * url = [NSURL URLWithString:_webstring];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    [self.webview loadRequest:request];
    
    [self.view addSubview:_webview];
    [_webview release];
    [request release];
 
    UIButton * fanhui = [UIButton buttonWithType:UIButtonTypeSystem];
    fanhui.frame= CGRectMake(30, self.view.frame.size.height - 70, 50, 50);
    fanhui.backgroundColor = [UIColor blackColor];
    [fanhui addTarget:self action:@selector(fanhuizhi) forControlEvents:UIControlEventTouchUpInside];
//    [fanhui setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    [fanhui setBackgroundImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    fanhui.layer.masksToBounds = YES;
    fanhui.layer.cornerRadius= 25;
    [self.view addSubview:fanhui];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)fanhuizhi
{
  
    [self  dismissViewControllerAnimated:YES completion:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    _webstring = nil;
    [_webview release];
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
