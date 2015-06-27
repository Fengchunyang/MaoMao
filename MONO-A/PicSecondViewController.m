//
//  PicSecondViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PicSecondViewController.h"

@interface PicSecondViewController ()

@end

@implementation PicSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
   
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:kScreenBounds];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.allUrl]];
    
     [web loadRequest:request];
    [self.view addSubview:web];
    
    self.backBtn = [UIButton buttonWithType:1];
    [self.backBtn setTitle:@"back" forState:0];
    self.backBtn.frame = CGRectMake(100, 100, 100, 100);
    self.backBtn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.backBtn];
    [self.backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
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

@end
