//
//  HuaBaoViewController.m
//  First
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "HuaBaoViewController.h"
#import "HuaBaoDataModel.h"
#import "Huabao1ViewController.h"
@interface HuaBaoViewController ()<UITableViewDataSource , UITableViewDelegate , NetWorkEngineDelegate>
@property (nonatomic , retain)UITableView *tableView;
@property (nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)NSMutableDictionary *bigDic;
@property (nonatomic , retain)UIButton *backBtn;
@end

@implementation HuaBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView =[[ UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.tableView];
    self.arr = [NSMutableArray array];
    self.bigDic = [NSMutableDictionary dictionary];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self getDataFromUrl];
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

- (void)getDataFromUrl
{
    NetWorkEngine *engine = [NetWorkEngine engineWithURL:[NSURL URLWithString:kHuabao] parameters:nil deleagte:self];
    [engine start];
}
- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    
    NSData *data = (NSData *)info;
    if (data) {
        
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.bigDic = [dic objectForKey:@"data"];
        
    self.arr = [self.bigDic objectForKey:@"articles"];

        
        
    [self.tableView reloadData];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Huabao1ViewController *huabao1 = [[Huabao1ViewController alloc]init];
  huabao1.link =  [[self.arr objectAtIndex:indexPath.row]objectForKey:@"weburl"];
    [self  presentViewController:huabao1 animated:YES completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [self.arr objectAtIndex:indexPath.row];
    
    
    
    NSString *cellID = @"cellID";
    ThirdPageModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ThirdPageModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    HuaBaoDataModel *dataModel = [[HuaBaoDataModel alloc]initWithDistionary:dic indexPath:indexPath];
    
    
    [cell.imaView sd_setImageWithURL:[NSURL URLWithString:dataModel.url] placeholderImage:[UIImage imageNamed:@"外滩画报"]];
    
    cell.label2.text = dataModel.title;
    cell.label1.text = dataModel.auther_name;
    [dataModel release];
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdPageModelCell *cell =(ThirdPageModelCell *) [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    [cell calculateHeight];
    return cell.frame.size.height;
    
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
    _arr = nil;
    _bigDic = nil;
    [_tableView release];
    [super dealloc];
}

@end
