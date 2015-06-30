//
//  MONOViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "MONOViewController.h"
#import "MONONextViewController.h"

@interface MONOViewController ()<NetWorkEngineDelegate>
@property (nonatomic , assign)NSString* Hot;

@end

@implementation MONOViewController

//- (void)loadView
//{
//    self.monoView = [[MONOVIew alloc]initWithFrame:kScreenBounds];
//    self.view = self.monoView;
//    [self.monoView release];
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview: _tableView];
    _tableView.backgroundColor = [UIColor blackColor];
    
    [_tableView release];
    self.bigDic = [NSDictionary dictionary];
    
    
    self.arr = [NSMutableArray array];
    
    
    
    //设置代理
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    NSString *UrlStr = @"http://mmmono.com/api/category/all?page=1";
    //创建URL对象
    NSURL *url = [NSURL URLWithString:UrlStr];
    
    NetWorkEngine *net = [NetWorkEngine engineWithURL:url parameters:nil deleagte:self];
    
    [net start];
    
    
    
    

    
    // Do any additional setup after loading the view.
}

- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    
    //大字典
    if (data) {
        self.bigDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //字典里的大数组
        self.arr = [self.bigDic objectForKey:@"items"];
    }
   
    
    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

#pragma mark - cell点击事件

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MONONextViewController *monoNext = [[MONONextViewController alloc]init];
    monoNext.indexPath = indexPath;
    monoNext.dic =[NSMutableDictionary dictionaryWithDictionary:self.bigDic] ;
    [self presentViewController:monoNext animated:YES completion:nil];
//    [self.navigationController pushViewController:monoNext animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dic = [self.arr objectAtIndex:indexPath.row];
    DataModel *model = [[DataModel alloc]initWithDictionary:dic];
    _Hot = [dic objectForKey:@"hot"];
    if ([_Hot integerValue] == 1) {
        NSString *cellID = @"cellID";
        
        ThirdModelCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (nil == cell1) {
            
            cell1 = [[ThirdModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
            
        }
        
        
        NSURL *imageUrl = [NSURL URLWithString:model.ImageView];
        [cell1.imaView sd_setImageWithURL:imageUrl];
        cell1.label1.text = model.title;
        cell1.label2.text = model.text;
        
        [cell1  calculateHeight];
        [model release];
        return cell1;
    }
    else {
        NSString *cellId = @"cellId";
        ThirdPageModelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (nil == cell) {
            cell = [[ThirdPageModelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        }
        NSURL *imageUrl = [NSURL URLWithString:model.ImageView];
        [cell.imaView sd_setImageWithURL:imageUrl];
        cell.label1.text = model.label1Text;
        cell.label2.text = model.title;
        [cell calculateHeight];
        [model release];
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if ([_Hot integerValue] == 1) {
        
        _ModelCell = (ThirdModelCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
        //        [_ModelCell calculateHeight];
        
        return _ModelCell.frame.size.height;
    }else{
        
        _PageCell = (ThirdPageModelCell *)[self tableView:self.tableView cellForRowAtIndexPath:indexPath];
        //        [_PageCell calculateHeight];
        
        return _PageCell.frame.size.height;
    }
    
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
    [_ModelCell release];
    [_PageCell release];
    _arr = nil;
    _bigDic = nil;
    [_tableView release];
    [super dealloc];
}

@end
