//
//  manhuaViewController.m
//  mono
//
//  Created by 张浩杰 on 15-7-2.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "manhuaViewController.h"
#import "ButtonView.h"
#import "NetWorkEngine.h"
#import "manhuaModel.h"
#import "manhuaTableViewCell.h"
#import "detainmanhuaViewController.h"
@interface manhuaViewController ()
@property(nonatomic,retain)UITableView * Contableview;


@end

@implementation manhuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController   setNavigationBarHidden:YES animated:YES];
    
     NSArray * Urlarray =[NSArray arrayWithObjects:@"http://api.kuaikanmanhua.com/v1/topics/104?sort=0",@"http://api.kuaikanmanhua.com/v1/topics/311?sort=0",@"http://api.kuaikanmanhua.com/v1/topics/116?sort=0",@"http://api.kuaikanmanhua.com/v1/topics/135?sort=0",@"http://api.kuaikanmanhua.com/v1/topics/173?sort=0",@"http://api.kuaikanmanhua.com/v1/topics/120?sort=0",@"http://api.kuaikanmanhua.com/v1/topics/273?sort=0",@"http://api.kuaikanmanhua.com/v1/topics/147?sort=0",@"http://api.kuaikanmanhua.com/v1/topics/329?sort=0",@"http://api.kuaikanmanhua.com/v1/topics/8?sort=0", nil];
    NSString * str = [Urlarray objectAtIndex:_num];
    manhuaDatahadling * haling = [[manhuaDatahadling alloc] initWithUrlString:str];
    haling.delegate = self;
    [haling release];
    
        self.Contableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height )];
    self.Contableview.delegate = self;
    self.Contableview.dataSource  =self;
    
    
    [self.view addSubview:_Contableview];
    
    
    
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(30 , self.view.frame.size.height - 70, 50, 50);
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 25;
    [self.view addSubview:button];
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)fanhui
{
    [self  dismissViewControllerAnimated:YES completion:nil];

}

-(void)manhuaDatahandlingdidFinshLoadingModel:(NSMutableArray *)model
{
    self.modelArray = [NSMutableArray array];
    self.modelArray = model;
    NSLog(@"%@",_modelArray);
    [self.Contableview reloadData];

}
-(void)dingduantupian:(NSString *)str
{
    self.string = str;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArray.count ;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString * cellindentifier = @"cell";
   manhuaTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellindentifier];
    if (cell == nil) {
        cell = [[manhuaTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellindentifier];
        
        
    
}
    manhuaModel * model = [self.modelArray  objectAtIndex:indexPath.row];
    
    
    cell.imageview.imageURL = [NSURL URLWithString:  model.imageurl];
    cell.conlabel.text = model.constr;
    cell.conlabel.font = [UIFont systemFontOfSize:13.0];
    cell.conlabel.textColor = [UIColor lightGrayColor];
    ButtonView * button = [[ButtonView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    button.tupian.imageURL = [NSURL URLWithString:_string];
    self.Contableview.tableHeaderView = button;
    [button release];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    detainmanhuaViewController * ctr = [[detainmanhuaViewController alloc] init];
    manhuaModel * model = [self.modelArray objectAtIndex:indexPath.row];
    ctr.webstring = model.webstr;
    ctr.ctr1 = self;
    [self   presentViewController:ctr animated:YES completion:nil];
    
    

}



- (void)dealloc
{
    _string = nil;
    _modelArray = nil;
    [_Contableview release];
    [_pro release];
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
