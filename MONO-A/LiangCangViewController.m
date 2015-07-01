//
//  LiangCangViewController.m
//  First
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "LiangCangViewController.h"
#import "LiangCangDataModel.h"
@interface LiangCangViewController ()<UITableViewDataSource , UITableViewDelegate , NetWorkEngineDelegate>
@property (nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)NSMutableDictionary *bigDic;
@property (nonatomic , retain)UITableView *tableView;
@property (nonatomic , retain)UIButton *backBtn;
@end

@implementation LiangCangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_tableView];
    [_tableView release];
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
    NSURL *url = [NSURL URLWithString:kLiangcang];
    NetWorkEngine *engine = [NetWorkEngine engineWithURL:url parameters:nil deleagte:self];
    [engine start];
}
- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    if (data) {
        
    
    NSDictionary * Dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.bigDic = [Dic objectForKey:@"data"];

    self.arr = [self.bigDic objectForKey:@"items"];

    [self.tableView reloadData];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    LiangCangDataModel *DataModel = [[LiangCangDataModel alloc]initWithDictionary:dic];
    NSString *cellID = @"cellID";
    ThirdPageModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[ThirdPageModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    HUD = [[MBProgressHUD alloc]initWithView:cell.imaView];
    [cell.imaView addSubview:HUD];
    [HUD show:YES];
    [cell.imaView sd_setImageWithURL:[NSURL URLWithString: DataModel.imaURL]];
    [HUD hide:YES];
    cell.label1.text = DataModel.Description;
     cell.label2.text = DataModel.title;
    
     return cell;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdPageModelCell *cell = (ThirdPageModelCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    [cell calculateHeight];
    return cell.frame.size.height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LiangCang1ViewController *liangcang1 = [[LiangCang1ViewController alloc]init];
    liangcang1.link = [[self.arr objectAtIndex:indexPath.row]objectForKey:@"access_url"];
    [self  presentViewController:liangcang1 animated:YES completion:nil];
    
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
    [_tableView release];
    _arr = nil;
    _bigDic = nil;
    [super dealloc];
}
@end