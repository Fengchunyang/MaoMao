//
//  TodayViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TodayViewController.h"
#import "TodayTableViewCell.h"
#import "TodayModel.h"

@interface TodayViewController ()<NetWorkEngineDelegate>

@property (nonatomic , retain) NSMutableArray *dataArray;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getDataFromNet];
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.backBtn = [UIButton buttonWithType:1];
    self.backBtn.backgroundColor = [UIColor clearColor];
    self.backBtn.frame = CGRectMake(30, self.view.frame.size.height - 70, 50, 50);
    self.backBtn.layer.cornerRadius = 25;
    self.backBtn.layer.masksToBounds = YES;
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBtn];
    [self.backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
//    NSLog(@"%@",self.TodayUrl);
    
//    self.tableView.rowHeight = 120;
    // Do any additional setup after loading the view.
}

- (void)getDataFromNet
{
    NetWorkEngine *net = [NetWorkEngine engineWithURL:[NSURL URLWithString:self.TodayUrl] parameters:nil deleagte:self];
    [net start];
}

- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    NSDictionary *newDic = dic[@"data"];
    NSArray *arr = newDic[@"articles"];
    
    for (NSDictionary *dic in arr) {
        if (dic[@"full_url"]&&((NSString *)dic[@"full_url"]).length > 0) {
            TodayModel *moday = [[TodayModel alloc]initWithDictionary:dic];
            
            NSArray *array = dic[@"media"];
            
            if (array.count > 3) {
                for (int i = 0; i < 2; i++) {
                    NSDictionary *dic1 = array[i];
                    moday.photo = dic1[@"url"];
                    [moday.imageArray addObject:moday.photo];
                }
            }else{
                NSDictionary *dic1 = array[0];
                moday.photo = dic1[@"url"];
            }
            
            [self.dataArray addObject:moday];
            [moday release];
  
        }
        
    }
    
    [self.tableView reloadData];
    
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)backBtnAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    TodayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[TodayTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
  
    TodayModel *model = [[TodayModel alloc]init];
    model = self.dataArray[indexPath.row];
    //cell.textLabel.text = str;
    
    cell.title.text = model.title;
//    cell.leftLabel.text = model.auther_name;
//    if (model.imageArray.count > 2) {
//        
//        
//        
//        
//    }else{
//        [cell.topImageView sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@"test"]];
//    }
    
    
    
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

@end
