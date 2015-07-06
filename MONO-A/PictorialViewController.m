//
//  PictorialViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PictorialViewController.h"
#import "NetWorkEngine.h"
#import "PictorialModel.h"
#import "PicSecondViewController.h"

#define kIdent @"myIdetn"

#define kPictorialUrl @"http://iliangcang.com:8200/topic/list?app_key=iphone&build=143&osVersion=82&v=2.2.0"

@interface PictorialViewController ()<NetWorkEngineDelegate>


@end

@implementation PictorialViewController


- (instancetype)init{
    
    self = [super init];
    
    if (self){
        _featureHeight = RPSlidingCellFeatureHeight;
        _collapsedHeight = RPSlidingCellCollapsedHeight;
        _scrollsToCollapsedRowsOnSelection = YES;
    }
    
    return self;
}

- (void)awakeFromNib {
    self.featureHeight = RPSlidingCellFeatureHeight;
    self.collapsedHeight = RPSlidingCellCollapsedHeight;
    self.scrollsToCollapsedRowsOnSelection = YES;
}




- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    [self getFromData];
    
    RPSlidingMenuLayout *layout = [[RPSlidingMenuLayout alloc]initWithDelegate:self];
    
    
    
    _collectView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    

    _collectView.delegate = self;
    _collectView.dataSource = self;
    
    [self.collectView registerClass:[RPSlidingMenuCell class] forCellWithReuseIdentifier:kIdent];
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.view addSubview:self.collectView];
    
    [_collectView release];
    [layout release];
    
    // Do any additional setup after loading the view.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)scrollToRow:(NSInteger)row animated:(BOOL)animated {
    
    NSInteger rowOffset = RPSlidingCellDragInterval * row;
    
    // do not need to flip to that row if already on it
    if (self.collectView.contentOffset.y == rowOffset) return;
    
    // show the category they picked
    [self.collectView setContentOffset:CGPointMake(0.0f, rowOffset) animated:animated];
    
}

#pragma mark - RPSlidingMenuLayoutDelegate

- (CGFloat)heightForFeatureCell {
    return self.featureHeight;
}

- (CGFloat)heightForCollapsedCell {
    return self.collapsedHeight;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RPSlidingMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdent forIndexPath:indexPath];
    PictorialModel *model =  self.dataArray[indexPath.row];
    
    
    
    
        
        cell.textLabel.text = model.title;
    
    cell.detailTextLabel.text = model.descrip;
    [cell.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:model.photo.url] placeholderImage:[UIImage imageNamed:@"test.jpg"]];
    
  

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self scrollToRow:indexPath.row animated:YES];
    

    NSString *url = ((PictorialModel *)self.dataArray[indexPath.row]).access_url;
    
    PicSecondViewController *picSecondVC = [[PicSecondViewController alloc]init];
    picSecondVC.allUrl = url;
    [self presentViewController:picSecondVC animated:YES completion:nil];
    [picSecondVC release];
    
    
    
    
}

#pragma mark - 数据
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)getFromData
{
    NetWorkEngine *net = [NetWorkEngine engineWithURL:[NSURL URLWithString:kPictorialUrl] parameters:nil deleagte:self];
    [net start];
}

- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    
    if (data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *first = dic[@"data"];
        NSArray *arr = first[@"items"];
        
        for (NSDictionary *dic in arr)
        {
            PictorialModel *picModel = [[PictorialModel alloc]initWithDictionary:dic];
            [self.dataArray addObject:picModel];
            
            [picModel release];
        }

    }
    
    [self.collectView reloadData];
    
}

- (void)dealloc
{
    _dataArray = nil;
    [_collectView release];
    [super dealloc];
}


@end
