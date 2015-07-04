//
//  YingXiangViewController.m
//  First
//
//  Created by lanouhn on 15/7/1.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "YingXiangViewController.h"

@interface YingXiangViewController ()<UITableViewDataSource , UITableViewDelegate , NetWorkEngineDelegate>
@property (nonatomic ,retain)UITableView *tableView;
@property (nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)NSMutableDictionary *bigDic;
@property (nonatomic , retain)UIButton *backBtn;
@property (nonatomic , assign)NSInteger num;
@end

@implementation YingXiangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
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
    //下拉刷新
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadnewData)];
    [self.tableView release];
    
}
//下拉刷新
-(void)loadnewData
{
    [self.arr removeAllObjects];
    [self setNum:1];
    [self getDataFromUrl];
    
    [self.tableView reloadData];
    [self stopReloadData];
}
- (NSMutableArray *)arr
{
    if (!_arr) {
        self.arr = [NSMutableArray array];
    }
    return _arr;
}
- (void)stopReloadData
{
    [self.tableView.header endRefreshing];
    
}

- (void)backBtnAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdPageModelCell *cell = (ThirdPageModelCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    [cell calculateHeight];
    return cell.frame.size.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [self.arr objectAtIndex:indexPath.row];
    HuaBaoDataModel *DataModel = [[HuaBaoDataModel alloc]initWithDistionary:dic indexPath:nil];
    NSString *cellID = @"cellID";
    ThirdPageModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[ThirdPageModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    HUD = [[MBProgressHUD alloc]initWithView:cell.imaView];
    [cell.imaView addSubview:HUD];
    [HUD show:YES];
    [cell.imaView sd_setImageWithURL:[NSURL URLWithString:DataModel.url] placeholderImage:[UIImage imageNamed:@"映像新闻"]];
    [HUD hide:YES];
    cell.label2.text = DataModel.title;
    cell.label1.text = DataModel.auther_name;
    return cell;
}
- (void)getDataFromUrl
{
    NetWorkEngine *engine = [NetWorkEngine engineWithURL:[NSURL URLWithString:kYingxiang] parameters:nil deleagte:self];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MONONextViewController *yingxiang1 = [[MONONextViewController alloc]init];
    yingxiang1.link = [[self.arr objectAtIndex:indexPath.row]objectForKey:@"weburl"];
    [self  presentViewController:yingxiang1 animated:YES completion:nil];
    [yingxiang1 release];
    
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
    [_backBtn  release];
    _arr = nil;
    _bigDic = nil;
    [_tableView release];
    [super dealloc];
}

@end
