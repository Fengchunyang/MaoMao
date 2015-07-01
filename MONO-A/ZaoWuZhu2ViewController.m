//
//  ZaoWuZhu2ViewController.m
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "ZaoWuZhu2ViewController.h"
#import "WeiJueDaShiViewController.h"
@interface ZaoWuZhu2ViewController ()<UITableViewDataSource , UITableViewDelegate , NetWorkEngineDelegate>

@property(nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)NSMutableDictionary *bigDic;
@property (nonatomic , retain)UIButton *backBtn;
@end

@implementation ZaoWuZhu2ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview: self.tableView];
    
    [self.tableView release];
    self.arr = [NSMutableArray array];
    self.bigDic = [NSMutableDictionary dictionary];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    
    
    [self getDataFromURL];
    
    // Do any additional setup after loading the view.
    self.backBtn = [UIButton buttonWithType:1];
    self.backBtn.backgroundColor = [UIColor clearColor];
    self.backBtn.frame = CGRectMake(30, self.view.frame.size.height - 70, 50, 50);
    self.backBtn.layer.cornerRadius = 25;
    self.backBtn.layer.masksToBounds = YES;
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBtn];
    [self.backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    //刷新的第二页;
    static NSInteger count = 2;
    //下拉刷新
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadnewData)];
    //上拉加载更多
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [self setNum:count++];
        [self getDataFromURL];
        [self.tableView reloadData];
    }];
    
    [self.tableView release];
    
}
//下拉刷新
-(void)loadnewData
{
    [self.arr removeAllObjects];
    [self setNum:1];
    [self getDataFromURL];
    
    [self.tableView reloadData];
    
}

- (void)backBtnAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiJueModelCell *cell = (WeiJueModelCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];

    [cell calculateHeight];
    return cell.frame.size.height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [self.arr objectAtIndex:indexPath.row];
    WeiJueDataModel *model = [[WeiJueDataModel alloc]initWithDictionary:dic];
    NSString *cellID = @"cellID";
    
    WeiJueModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[WeiJueModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    NSString *newStr1 = [model.mainpic substringFromIndex:1];
    NSString *str1 = [NSString stringWithFormat:@"http://manage.legendzest.cn%@" , newStr1];
    [cell.mainpicView sd_setImageWithURL:[NSURL URLWithString:str1]];
    NSString *newStr2 = [model.pic substringFromIndex:1];
    NSString *str2 = [NSString stringWithFormat:@"http://manage.legendzest.cn%@" , newStr2];
    [cell.picview sd_setImageWithURL:[NSURL URLWithString:str2]];
    
    
    
    cell.titleLabel.text = model.title;
    cell.maketimeLabel.text = model.maketime;
    cell.short_contentLabel.text = model.short_content;
    cell.knameLabel.text = model.kname;
    cell.materalLabel.text = model.materal;
    [cell calculateHeight];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 
*/

- (void)getDataFromURL
{

    
    NetWorkEngine *engine = [NetWorkEngine engineWithURL:[NSURL URLWithString:kWeiJueDaShi] parameters:nil deleagte:self];
    [engine start];

}
- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    if (data) {
        
    
    self.bigDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.arr = [self.bigDic objectForKey:@"res"];
//    NSLog(@"******%@" , self.arr);
    [self.tableView reloadData];
    
}
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiJueDaShiViewController *weijue = [[WeiJueDaShiViewController alloc]init];
    weijue.idStr = [[self.arr objectAtIndex:indexPath.row]objectForKey:@"id"];
    [self  presentViewController:weijue animated:YES completion:nil];
}

- (void)dealloc
{
    [_backBtn  release];
    _arr = nil;
    _bigDic = nil;
    [_tableView release];
    [super dealloc];
}
@end
