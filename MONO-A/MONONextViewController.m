//
//  MONONextViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "MONONextViewController.h"

@interface MONONextViewController ()<NetWorkEngineDelegate>
@property (nonatomic , retain)MBProgressHUD *HUD;
@property (nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)NSMutableDictionary *bigDic;

@end

@implementation MONONextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.webView1 = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.webView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview :self.webView1];
    [self.webView1 release];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.link]];
    [self.webView1 loadRequest:request];
    
    self.backBtn = [UIButton buttonWithType:1];
    self.backBtn.backgroundColor = [UIColor clearColor];
    self.backBtn.frame = CGRectMake(30, self.view.frame.size.height - 70, 50, 50);
    self.backBtn.layer.cornerRadius = 25;
    self.backBtn.layer.masksToBounds = YES;
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBtn];
    [self.backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(self.backBtn.frame.origin.x + 130, self.backBtn.frame.origin.y, self.backBtn.frame.size.width, self.backBtn.frame.size.height);
    button.layer.cornerRadius = 20;
    button.layer.masksToBounds = YES;

    [button setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)buttonAction
{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"55962bb367e58e94c2000af8"
                                      shareText:self.link
                                     shareImage:nil
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent, nil]
                                       delegate:nil];
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
    _dic = nil;
    [_HUD release];
    _indexPath = nil;
    _link = nil;
    _arr = nil;
    _bigDic = nil;
    [_webView1 release];
    [super dealloc];
}

@end
