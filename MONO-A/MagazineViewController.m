//
//  MagazineViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "MagazineViewController.h"
#import "Pictorial2Model.h"
#import "PictorialCell.h"
#import "MJRefresh.h"

@interface MagazineViewController ()<UITableViewDataSource , UITableViewDelegate>
@property (nonatomic , retain)UITableView *tableView;
@end

@implementation MagazineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //隐藏table分割线;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.num =1;
    [self getDatafromUrl];
    
    //刷新的第二页;
    static NSInteger count = 2;
    //下拉刷新
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadnewData)];
    //上拉加载更多
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [self setNum:count++];
        [self getDatafromUrl];
        [self.tableView reloadData];
    }];
    
    [self.tableView release];
    
}
//下拉刷新
-(void)loadnewData
{
    [self.modelArray removeAllObjects];
    [self setNum:1];
    [self getDatafromUrl];
    
    [self.tableView reloadData];
    
}

//结束刷新
- (void)stopReloadData
{
    [self.tableView.header endRefreshing];
    [self.tableView.footer endRefreshing];
}



-(NSMutableArray *)modelArray
{
    if (!_modelArray) {
        self.modelArray = [NSMutableArray array];
    }
    return _modelArray;
}


-(void)getDatafromUrl
{
    NSString * str = [NSString stringWithFormat:@"http://mmmono.com/api/category/image?page=%ld",_num];
    //NSString * str = @"http://mmmono.com/api/category/image?page=1";
    NSURL * url = [NSURL URLWithString:str];
    NetWorkEngine * engine = [NetWorkEngine engineWithURL:url parameters:nil deleagte:self];
    [engine start];
    
}

-(void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData * data = (NSData *)info;
    
    if (data) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray * array = [dic objectForKey:@"items"];
        for (NSDictionary * smallDic in array) {
            Pictorial2Model * model = [[Pictorial2Model alloc] initWithDictionary:smallDic];
            [self.modelArray addObject:model];
        }
    }
   
    
    [self.tableView reloadData];
    [self stopReloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.modelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static  NSString * indentifier = @"cell";
    PictorialCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell==nil) {
        cell = [[PictorialCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier];
    }
    Pictorial2Model * model = [[Pictorial2Model alloc] init];
    model = [self.modelArray objectAtIndex:indexPath.row];
    
    [cell.BIGimage sd_setImageWithURL:[NSURL URLWithString:model.BIGimage ]];
    cell.subimage.image = [UIImage imageNamed:@"icon-pic"];
    cell.conLabel.text = model.conStr;
    cell.conLabel.font = [UIFont systemFontOfSize:13.0];
    cell.conLabel.textColor = [UIColor  lightGrayColor];
    cell.conLabel.numberOfLines = 0;
    
    cell.titleLabel.text = model.titleStr;
    cell.titleLabel.font = [UIFont systemFontOfSize:15.0];
    
    cell.subLabel.text = model.subStr;
    cell.subLabel.font = [UIFont systemFontOfSize:10.0];
    cell.subLabel.backgroundColor = [UIColor colorWithRed:arc4random()%255/256.0 green:arc4random()%255/256.0 blue:arc4random()%255/256.0 alpha:1.0];
    cell.subLabel.numberOfLines = 0;
    cell.subLabel.textAlignment = NSTextAlignmentCenter;
    
    NSString * str = @"from";
    cell.aLabel.text = str;
    cell.aLabel.font = [UIFont systemFontOfSize:9.0];
    cell.aLabel.textColor = [UIColor whiteColor];
    cell.aLabel.textAlignment = NSTextAlignmentCenter;
    // cell.FromLabel.text =  [str stringByAppendingString:model.IntroStr];
    cell.FromLabel.text = model.IntroStr;
    cell.FromLabel.font = [UIFont systemFontOfSize:9.0];
    cell.FromLabel.textColor = [UIColor whiteColor];
    
    
    
    return cell;
}
//高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 325;
    
    
}
//push进下一层
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MONONextViewController * ctr = [[MONONextViewController alloc] init];
    Pictorial2Model * model = [self.modelArray objectAtIndex:indexPath.row];
    ctr.link = model.linkStr1;
    [self  presentViewController:ctr animated:YES completion:nil];
    [ctr release];
    
}




- (void)dealloc
{
    _modelArray = nil;
    [super dealloc];
}

@end
