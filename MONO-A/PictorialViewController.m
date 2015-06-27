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

#define kPictorialUrl @"http://iliangcang.com:8200/topic/list?app_key=iphone&build=143&osVersion=82&v=2.2.0"

@interface PictorialViewController ()<NetWorkEngineDelegate>



{
    UICollectionView *galleryCollectionView;
}

@end

@implementation PictorialViewController

//- (void)loadView
//{
//    self.pictorialView = [[PictorialVIew alloc]initWithFrame:kScreenBounds];
//    self.view = self.pictorialView;
//    [self.pictorialView release];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getFromData];
    
    [self initCollectionView];
    
    // Do any additional setup after loading the view.
}

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
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSDictionary *first = dic[@"data"];
    NSArray *arr = first[@"items"];
    
    for (NSDictionary *dic in arr)
    {
        PictorialModel *picModel = [[PictorialModel alloc]initWithDictionary:dic];
        [self.dataArray addObject:picModel];
        
        [picModel release];
    }
    
    [galleryCollectionView reloadData];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)initData
//{
//    for (int i=0; i<20; i++) {
//        [self.dataArray addObject:@"test.jpg"];
//    }
//}

-(void)initCollectionView
{
    ZZGallerySliderLayout *layout = [[ZZGallerySliderLayout alloc] init];
    [layout setContentSize:10000];
    galleryCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CELL_WIDTH, CGRectGetHeight([UIScreen mainScreen].bounds)) collectionViewLayout:layout];
    [galleryCollectionView registerClass:[ZZGallerySliderCell class] forCellWithReuseIdentifier:@"CELL"];
    galleryCollectionView.delegate = self;
    galleryCollectionView.dataSource = self;
    [self.view addSubview:galleryCollectionView];
}

#pragma -mark UICollectionView 代理方法

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count+1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return CGSizeMake(CELL_WIDTH, HEADER_HEIGHT);
    }else if(indexPath.row == 1){
        return CGSizeMake(CELL_WIDTH, CELL_CURRHEIGHT);
    }else{
        return CGSizeMake(CELL_WIDTH, CELL_HEIGHT);
    }
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZZGallerySliderCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.delegate = self;
    cell.tag = indexPath.row;
    [cell setIndex:indexPath.row];
    [cell reset];
    
    if(indexPath.row == 0){
        cell.imageView.image = nil;
    }else{
        if(indexPath.row == 1){
            [cell revisePositionAtFirstCell];
        }
        
        PictorialModel *model = [[PictorialModel alloc]init];
        model =  self.dataArray[indexPath.row - 1];
        [cell setNameLabel:model.title];
        [cell setDescLabel:model.descrip];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo.url] placeholderImage:[UIImage imageNamed:@"test.jpg"]];
//        UIImage *image = [UIImage imageNamed:[self.dataArray objectAtIndex:indexPath.row-1]];
//        cell.imageView.image = image;
    }
    return cell;
}


#pragma mark - 详情页面
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *url = ((PictorialModel *)self.dataArray[indexPath.row]).access_url;
    
    PicSecondViewController *picSecondVC = [[PicSecondViewController alloc]init];
    picSecondVC.allUrl = url;
    [self presentViewController:picSecondVC animated:YES completion:nil];
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
