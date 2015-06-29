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
    
    self.arr = [NSMutableArray array];
    self.bigDic = [NSMutableDictionary dictionary];
    self.bigDic = [NSMutableDictionary dictionaryWithDictionary:self.dic];
    self.arr = [self.bigDic objectForKey:@"items"];
    
    self.link = [[self.arr objectAtIndex:self.indexPath.row] objectForKey:@"link"];
    NSLog(@"self.link = %@" , self.link);
    [self downLoding];
    
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

- (void)downLoding
{
    
    if (self.link.length == 0) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"提示" message:@"对不起，该页面不能访问" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil, nil];
        [alter show];
    }else{
        _HUD = [[MBProgressHUD alloc]initWithView:self.view];
        [self.view.window addSubview:_HUD];
        
        
        _HUD.labelText = @"玩命加载中.....";
        [_HUD show:YES];
        NSURL *reqUrl = [NSURL URLWithString:self.link];
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:reqUrl];
        NSLog(@"request = %@" , request);
        [self.webView1 loadRequest:request];
        [_HUD hide:YES];
        [_HUD release];
    }
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
