//
//  WeiJueDaShiViewController.m
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "WeiJueDaShiViewController.h"

@interface WeiJueDaShiViewController ()
{
    MBProgressHUD *HUD;
}
@property (nonatomic , retain)UIButton *backBtn;
@end

@implementation WeiJueDaShiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:webView];
    
    
    
    
        HUD = [[MBProgressHUD alloc]initWithView:webView];
    [webView.window addSubview:HUD];
    HUD.labelText = @"玩命加载中....";
    [HUD show:YES];
    
    
    
    
    NSString *str = [NSString stringWithFormat:@"http://app.legendzest.cn/index.php?g=api24&m=cookbook&a=getinfo&version=2.0&device=8C510210-FD01-4A04-A6AD-B8ACBAA75532&d_type=2&safe_code=safe_code_shangweiji&uid=null&uid=&igetui_cid=0&id=%ld" , (long)[self.idStr integerValue]];

    
    
    if ((!([self.idStr isKindOfClass:[NSNull class]]) ) &&(self.idStr.length > 0) ) {
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:str]];
        
        [webView loadRequest:request];
        [HUD hide:YES];
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"你所访问的网页不存在" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    

   [HUD release];
    [webView release];
    
    self.backBtn = [UIButton buttonWithType:1];
    self.backBtn.backgroundColor = [UIColor clearColor];
    self.backBtn.frame = CGRectMake(30, self.view.frame.size.height - 70, 50, 50);
    self.backBtn.layer.cornerRadius = 25;
    self.backBtn.layer.masksToBounds = YES;
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBtn];
    [self.backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(self.backBtn.frame.origin.x + 130, self.backBtn.frame.origin.y, self.backBtn.frame.size.width - 3, self.backBtn.frame.size.height - 3);
    button.layer.cornerRadius = 8;
    button.layer.masksToBounds = YES;
    
    [button setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self backBtnAction:nil];
    }
}
- (void)buttonAction
{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"55962bb367e58e94c2000af8"
                                      shareText: [NSString stringWithFormat:@"http://app.legendzest.cn/index.php?g=api24&m=cookbook&a=getinfo&version=2.0&device=8C510210-FD01-4A04-A6AD-B8ACBAA75532&d_type=2&safe_code=safe_code_shangweiji&uid=null&uid=&igetui_cid=0&id=%ld" , (long)[self.idStr integerValue]]
                                     shareImage:nil
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent , nil]
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

@end
