//
//  PastViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PastViewController.h"
#import "ProgramView1.h"
#import "Data handling.h"
#import "ProgramModel.h"
#import "ProgramCell.h"
//#import "ProgramDetailsController.h"
//#import "DetailController.h"
#import "manhuaViewController.h"
@interface PastViewController ()

@end

@implementation PastViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"节目单";
    
    NSString * url = @"http://mmmono.com/api/category/program?page=1";
    self.handling = [[Data_handling alloc] initWithUrlString:url];
    _handling.delegate = self;
    
    
    
    UICollectionViewFlowLayout *  layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(150, 150);
    layout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 25);
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 20;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //区头
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 15);
    //区尾
    layout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 15);
    //注册cell
    
    
    self.prograView  = [[ProgramView1 alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    [self.view addSubview:_prograView];
    self.prograView.delegate = self;
    self.prograView.dataSource = self;
    [_prograView release];
    
    
    // Do any additional setup after loading the view.
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProgramCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray * array = [NSArray arrayWithObjects:@"001.jpg",@"002.jpg",@"003.jpg",@"004.jpg",@"005.jpg",@"006.jpg",@"007.jpg",@"008.jpg",@"009.jpg",@"0010.jpg", nil];
    //    for (int i = 0; i< 10; i++) {
    //        NSString * str = [array objectAtIndex:i];
    //        cell.photoView.placeholderImage = [UIImage imageNamed:@"0010.jpg"];
    //    }
    //
    
    
    ProgramModel * model  =  [self.array  objectAtIndex:indexPath.row];
    NSString * str = [array objectAtIndex:indexPath.row];
    cell.photoView.image = [UIImage imageNamed:str];
    // cell.photoView.imageURL = [NSURL  URLWithString:model.thumb_url];
    cell.label.text = model.title;
    //cell.label.text = model.desc;
    cell.label.textColor = [UIColor whiteColor];
    cell.label.textAlignment = NSTextAlignmentCenter;
    cell.label.alpha = 0.5;
    cell.label.backgroundColor = [UIColor blackColor];
    
    cell.introLabel.text = model.desc;
    cell. introLabel.font = [UIFont systemFontOfSize:12.0];
    cell.introLabel.textColor = [UIColor whiteColor];
    cell.introLabel.textAlignment = NSTextAlignmentCenter;
    cell.introLabel.alpha = 0.5;
    cell.introLabel.backgroundColor = [UIColor blackColor];
    
    
    
    
    
    return cell;
    
    
    
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //判断是设置区头还是脚用if判断
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //设置分区头
        UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor whiteColor];
        return headerView;
    }else{
        UICollectionReusableView * FootView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot"forIndexPath:indexPath];
        FootView.backgroundColor = [UIColor whiteColor];
        return FootView;
        
        
    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section = %ld , row = %ld",indexPath.section , indexPath.row);
    manhuaViewController * ctr = [[manhuaViewController alloc] init];
    ctr.num = indexPath.row;
    ctr.pro = self;
    [self presentViewController:ctr animated:YES completion:nil];
    [ctr release];
    
}














//实现代理方法
-(void)DatahandlingdidFinshLoadingModel:(NSMutableArray *)model
{
    self.array = [NSMutableArray array];
    self.array = model;
    [self.prograView reloadData];
    
    
    
    // NSLog(@"%@",model);
}

- (void)dealloc
{
    _array = nil;
    [_handling release];
    [_prograView release];
    [super dealloc];
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

@end
