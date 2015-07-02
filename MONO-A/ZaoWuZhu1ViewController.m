//
//  ZaoWuZhu1ViewController.m
//  First
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "ZaoWuZhu1ViewController.h"
#import "ViceChinaDataModel.h"
#import "ViceChinaViewController.h"
@interface ZaoWuZhu1ViewController ()<UITableViewDataSource , UITableViewDelegate , NetWorkEngineDelegate>

@property (nonatomic , retain)NSMutableArray *arr;
@property (nonatomic , retain)NSMutableDictionary *bigDic;
@property (nonatomic , retain)UIButton *backBtn;
@property (nonatomic , assign)NSInteger num;
@end

@implementation ZaoWuZhu1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview: self.tableView];

    self.arr = [NSMutableArray array];
    self.bigDic = [NSMutableDictionary dictionary];
    self.num = 1;
    [self getDataFromUrl];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
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
    
    // Do any additional setup after loading the view.
    //下拉刷新
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadnewData)];
    //上拉加载更多
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [self setNum:count++];
        NSLog(@"%ld" , _num);
        [self getDataFromUrl];
        
        [self.tableView reloadData];
        
    }];
    
    [self.tableView release];
    
}
//下拉刷新
-(void)loadnewData
{
    [self.arr removeAllObjects];
    [self setNum:1];
    [self getDataFromUrl];
    
    [self.tableView reloadData];
    
}
- (void)stopReloadData
{
    [self.tableView.header endRefreshing];
    [self.tableView.footer endRefreshing];
    
}

- (void)backBtnAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSDictionary *dic = [NSDictionary dictionary];
    
    NSDictionary  *dic = [self.arr objectAtIndex:indexPath.row];
    
    ViceChinaDataModel *model = [[ViceChinaDataModel alloc]initWithDictionary:dic];
    
    
    NSString *cellID = @"cellID";
    
    
    ViceChinaModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[ViceChinaModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    [cell.imaView sd_setImageWithURL:[NSURL URLWithString:model.images]];
    cell.label1.text = model.title;
    cell.label2.text = model.preview;

    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViceChinaModelCell *cell = (ViceChinaModelCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    [cell calculateHeight];
    return cell.frame.size.height;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)getDataFromUrl
{ NSString *str = [NSString stringWithFormat:@"http://www.vice.com/en_us/api/getvicetoday/%ld?name=homeFeed" , _num];
    NSURL *Url = [NSURL URLWithString:str];
   
    NetWorkEngine *engine = [NetWorkEngine engineWithURL:Url parameters:nil deleagte:self];
    [engine start];
}
- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    if(data){
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.bigDic = [dic objectForKey:@"data"];
    NSArray * arr = [self.bigDic objectForKey:@"items"];
        [self.arr addObjectsFromArray:arr];

    [self.tableView reloadData];
        [self stopReloadData];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViceChinaViewController *vice = [[ViceChinaViewController alloc]init];
   vice.link =  [[self.arr objectAtIndex:indexPath.row]objectForKey:@"url"];
    [self presentViewController:vice animated:YES completion:nil];
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
