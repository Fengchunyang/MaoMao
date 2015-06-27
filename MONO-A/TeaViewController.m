//
//  TeaViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TeaViewController.h"
#import "TeaTableViewCell.h"
#import "NetWorkEngine.h"

#define kTeaCellID @"teaCellID"

@interface TeaViewController ()<UITableViewDataSource , UITableViewDelegate , NetWorkEngineDelegate>

@end

@implementation TeaViewController

//- (void)loadView
//{
//    self.teaView = [[TeaView alloc]initWithFrame:kScreenBounds];
//    self.view = self.teaView;
//    [self.teaView release];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.tableView = [[UITableView alloc]initWithFrame:kScreenBounds];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
    
    self.arr = @[@"小明" , @"小王" , @"小李"];
    
    [self getDataFromUrl];
    
    // Do any additional setup after loading the view.
}

- (void)getDataFromUrl
{
    NetWorkEngine *net = [NetWorkEngine engineWithURL:[NSURL URLWithString:kMonoTeaUrl] parameters:nil deleagte:self];
    [net start];
}

- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return [TeaTableViewCell heightForCellWithTeaModel:<#(TeaModel *)#>];
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *teaCellID = kTeaCellID;
    TeaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:teaCellID];
    if (nil == cell) {
        cell = [[TeaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:teaCellID];
    }
    //cell.imageView.image = [UIImage imageNamed:@"333.jpg"];
    cell.titleLabel.text = @"ceshi";
    cell.contentLabel.text = @"neirong";
    
    
    return cell;
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

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
