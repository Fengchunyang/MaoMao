//
//  ProgrammeViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ProgrammeViewController.h"
#import "ProCollectionViewCell.h"
#import "ProModel.h"
#import "TodayViewController.h"
#import "AppDelegate.h"

#import "HACollectionViewSmallLayout.h"
#import "HACollectionViewLargeLayout.h"

#define kProUrl @"http://iphone.myzaker.com/zaker/apps_v3.php?_appid=iphone&_version=6.11&act=getAllAppsData"

#define kTransitionSpeed 0.02f
#define kLargeLayoutScale 2.5F


@interface ProgrammeViewController ()<NetWorkEngineDelegate>

@property (nonatomic, assign) NSInteger slide;
@property (nonatomic, retain) UIView *mainView;
@property (nonatomic, retain) UIImageView *topImage;
@property (nonatomic, retain) UIImageView *reflected;
@property (nonatomic, retain) HACollectionViewLargeLayout *largeLayout;
@property (nonatomic, retain) HACollectionViewSmallLayout *smallLayout;
@property (nonatomic, getter=isFullscreen) BOOL fullscreen;
@property (nonatomic, getter=isTransitioning) BOOL transitioning;
@property (nonatomic, assign) BOOL isZooming;
@property (nonatomic, assign) CGFloat lastScale;


@property (retain, nonatomic) UIPinchGestureRecognizer *pinch;
@property (nonatomic) CGFloat initialScale;

@property (nonatomic , retain) NSMutableArray *dataArray;

@property (nonatomic , retain) NSMutableArray *imageArray;


@end

@implementation ProgrammeViewController

//- (void)loadView
//{
//    self.programmeView = [[ProgrammeVIew alloc]initWithFrame:kScreenBounds];
//    self.view = self.programmeView;
//    [self.programmeView release];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageArray = [NSMutableArray array];
    for (int i = 0; i < 9; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        [self.imageArray addObject:image];
    }
    
    [self getDataFromNet];
    self.galleryImages = @[@"image1", @"image2", @"image3", @"image4"];
    _slide = 0;
    
    
    // Custom layouts
    _smallLayout = [[HACollectionViewSmallLayout alloc] init];
    _largeLayout = [[HACollectionViewLargeLayout alloc] init];
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 667-270, 375, 270) collectionViewLayout:_smallLayout];
    [_collectionView registerClass:[ProCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _collectionView.collectionViewLayout = _smallLayout;
    _collectionView.clipsToBounds = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    
    self.view.clipsToBounds = YES;
    
    // Shadow on collection
   //[_collectionView setClipsToBounds:YES];
    [_collectionView.layer setShadowOffset:CGSizeMake(0, 0)];
    [_collectionView.layer setShadowColor:[[UIColor clearColor] CGColor]];
    [_collectionView.layer setShadowRadius:6.0];
    [_collectionView.layer setShadowOpacity:0.5];
    
     //Improve shadow performance
    CGPathRef path = [UIBezierPath bezierPathWithRect:_collectionView.bounds].CGPath;
    [_collectionView.layer setShadowPath:path];
    
    
    // Init mainView
    _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    _mainView.clipsToBounds = YES;
    _mainView.layer.cornerRadius = 4;
    [self.view insertSubview:_mainView belowSubview:_collectionView];
    
    // ImageView on top
    _topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 375)];
    _reflected = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_topImage.bounds), 375, 375)];
    [_mainView addSubview:_topImage];
    [_mainView addSubview:_reflected];
    
    
    // Reflect imageView
    _reflected.transform = CGAffineTransformMakeScale(1.0, -1.0);
    
    
    // Gradient to top image
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _topImage.bounds;
    gradient.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4] CGColor],
                        (id)[[UIColor colorWithWhite:0 alpha:0] CGColor]];
    [_topImage.layer insertSublayer:gradient atIndex:0];
    
    
    // Gradient to reflected image
    CAGradientLayer *gradientReflected = [CAGradientLayer layer];
    gradientReflected.frame = _reflected.bounds;
    gradientReflected.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor],
                                 (id)[[UIColor colorWithWhite:0 alpha:0] CGColor]];
    [_reflected.layer insertSublayer:gradientReflected atIndex:0];
    
    
    // Content perfect pixel
    UIView *perfectPixelContent = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_topImage.bounds), 1)];
    
    
    perfectPixelContent.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
    [_topImage addSubview:perfectPixelContent];
    
    [perfectPixelContent release];
    
    // Label logo
    UILabel *logo = [[UILabel alloc] initWithFrame:CGRectMake(15, 12, 290, 0)];
    logo.backgroundColor = [UIColor clearColor];
    logo.textColor = [UIColor whiteColor];
    logo.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    logo.text = @"Paper";
    [logo sizeToFit];
    // Label Shadow
    [logo setClipsToBounds:NO];
    [logo.layer setShadowOffset:CGSizeMake(0, 0)];
    [logo.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [logo.layer setShadowRadius:1.0];
    [logo.layer setShadowOpacity:0.6];
    [_mainView addSubview:logo];
    
    [logo release];
    
    // Label Title
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, logo.frame.origin.y + CGRectGetHeight(logo.frame) + 8, 290, 0)];
    title.backgroundColor = [UIColor clearColor];
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    title.text = @"Heberti Almeida";
    [title sizeToFit];
    // Label Shadow
    [title setClipsToBounds:NO];
    [title.layer setShadowOffset:CGSizeMake(0, 0)];
    [title.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [title.layer setShadowRadius:1.0];
    [title.layer setShadowOpacity:0.6];
    [_mainView addSubview:title];
    [title release];
    
    // Label SubTitle
    UILabel *subTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, title.frame.origin.y + CGRectGetHeight(title.frame), 290, 0)];
    subTitle.backgroundColor = [UIColor clearColor];
    subTitle.textColor = [UIColor whiteColor];
    subTitle.font = [UIFont fontWithName:@"Helvetica" size:13];
    subTitle.text = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit";
    subTitle.lineBreakMode = NSLineBreakByWordWrapping;
    subTitle.numberOfLines = 0;
    [subTitle sizeToFit];
    // Label Shadow
    [subTitle setClipsToBounds:NO];
    [subTitle.layer setShadowOffset:CGSizeMake(0, 0)];
    [subTitle.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [subTitle.layer setShadowRadius:1.0];
    [subTitle.layer setShadowOpacity:0.6];
    [_mainView addSubview:subTitle];
    [subTitle release];
    //[self.view addSubview:_mainView];
    [self.view addSubview:_collectionView];
    
    // First Load
    [self changeSlide];
    

    NSTimer *timer = [NSTimer timerWithTimeInterval:5.0f target:self selector:@selector(changeSlide) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.collectionView reloadData];
    self.mainView.frame = CGRectMake(0, 0, 375, 667);
}

- (void)viewWillAppear:(BOOL)animated
{
    self.mainView.frame = CGRectMake(0, 0, 375, 667);
}

#pragma mark - 获取数据
- (void)getDataFromNet
{
    NetWorkEngine *net = [NetWorkEngine engineWithURL:[NSURL URLWithString:kProUrl] parameters:nil deleagte:self];
    [net start];
}

- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info
{
    NSData *data = (NSData *)info;
    if (data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dic1 = dic[@"data"];
        NSArray *arr = dic1[@"datas"];
        
        for (NSDictionary *dic2  in arr) {
            
            if ([dic2[@"title"]isEqualToString:@"主题订阅"])
            {
                NSArray *sonsArr = dic2[@"sons"];
                for (NSDictionary *newDic in sonsArr) {
                    if ([newDic[@"title"]isEqualToString:@"苹果"]) {
                        ProModel *proModel = [[ProModel alloc]initWithDictionary:newDic];
                        [self.dataArray addObject:proModel];
                        [proModel release];
                        
                    }
                    if ([newDic[@"title"]isEqualToString:@"摄影学堂"]){
                        ProModel *proModel = [[ProModel alloc]initWithDictionary:newDic];
                        [self.dataArray addObject:proModel];
                        [proModel release];
                    }
                    
                    if ([newDic[@"title"]isEqualToString:@"BAT"]){
                        ProModel *proModel = [[ProModel alloc]initWithDictionary:newDic];
                        [self.dataArray addObject:proModel];
                        [proModel release];
                    }
                }
            }
            
            
            
            if ([dic2[@"title"]isEqualToString:@"视觉"])
            {
                NSArray *sonsArr = dic2[@"sons"];
                for (NSDictionary *newDic in sonsArr)
                {
                    if ([newDic[@"title"]isEqualToString:@"摄影精选"]) {
                        NSArray *newSonsarr = newDic[@"sons"];
                        
                        for (NSDictionary *dic in newSonsarr) {
                            
                            if ([dic[@"title"]isEqualToString:@"视觉志"]) {
                                ProModel *proModel = [[ProModel alloc]initWithDictionary:dic];
                                [self.dataArray addObject:proModel];
                                [proModel release];
                            }
                        }
                        
                        break;
                        
                    }
                    
                    
                }
            }
            
            
            
            if ([dic2[@"title"]isEqualToString:@"科技"]) {
                NSArray *sonsArr = dic2[@"sons"];
                for (NSDictionary *newDic in sonsArr) {
                    if ([newDic[@"title"]isEqualToString:@"科技频道"]) {
                        ProModel *proModel = [[ProModel alloc]initWithDictionary:newDic];
                        [self.dataArray addObject:proModel];
                        
                        [proModel release];
                    }
                    
                    if ([newDic[@"title"]isEqualToString:@"极客公园"]) {
                        ProModel *proModel = [[ProModel alloc]initWithDictionary:newDic];
                        [self.dataArray addObject:proModel];
                        
                        [proModel release];
                    }
                    
                    if ([newDic[@"title"]isEqualToString:@"观察者网-科技"]) {
                        ProModel *proModel = [[ProModel alloc]initWithDictionary:newDic];
                        [self.dataArray addObject:proModel];
                        
                        [proModel release];
                    }
                }
            }
            
            
            
            if ([dic2[@"title"]isEqualToString:@"娱乐"]){
                NSArray *sonsArr = dic2[@"sons"];
                for (NSDictionary *newDic in sonsArr){
                    if ([newDic[@"title"]isEqualToString:@"电影资讯"]) {
                        ProModel *proModel = [[ProModel alloc]initWithDictionary:newDic];
                        [self.dataArray addObject:proModel];
                        
                        [proModel release];
                    }
                    
                    if ([newDic[@"title"]isEqualToString:@"凤凰网娱乐"]) {
                        ProModel *proModel = [[ProModel alloc]initWithDictionary:newDic];
                        [self.dataArray addObject:proModel];
                        
                        [proModel release];
                    }
                    
                }
            }
            
            
            
        }
    }
    
   
    
    [self.collectionView reloadData];
    
}

#pragma mark - 懒加载
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


#pragma mark - Hide StatusBar
- (BOOL)prefersStatusBarHidden
{
    return YES;
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   ProCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 4;
    
//    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleFingerTap:)];
//    twoFingerTap.numberOfTouchesRequired = 2;
//    [cell addGestureRecognizer:twoFingerTap];
   
    cell.titleLabel.text = ((ProModel *)self.dataArray[indexPath.row]).title;
    
    UIImage *image = self.imageArray[indexPath.row];
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 20, 10, 10);
    [image resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:image];
    
    

    
    cell.backgroundView = backgroundView;
    
    [backgroundView release];
    return cell;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    _collectionView.decelerationRate = UIScrollViewDecelerationRateNormal;
    
    [_collectionView snapshotViewAfterScreenUpdates:YES];
    
    
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        
        // Transform to zoom in effect
        _mainView.transform = CGAffineTransformScale(_mainView.transform, 0.96, 0.96);
        
    } completion:^(BOOL finished) {
          _mainView.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
    
    /*
    
    // Start transition
    _transitioning = YES;
    
    if (_fullscreen) {
        _fullscreen = NO;
        _collectionView.decelerationRate = UIScrollViewDecelerationRateNormal;
        
        [_collectionView snapshotViewAfterScreenUpdates:YES];
        //_collectionView.frame = CGRectMake(0, 314, 375, 254);
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            // Change flow layout
            [_collectionView setCollectionViewLayout:_smallLayout animated:YES];
            _collectionView.backgroundColor = [UIColor clearColor];
            
            // Reset scale
            _mainView.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            _transitioning = NO;
        }];
    }
    else {
        _fullscreen = YES;
        _collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
        //_collectionView.frame = CGRectMake(0, 0, 375, 667);
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            // Change flow layout
            [_collectionView setCollectionViewLayout:_largeLayout animated:YES];
            _collectionView.backgroundColor = [UIColor blackColor];
            
            // Transform to zoom in effect
            _mainView.transform = CGAffineTransformScale(_mainView.transform, 0.96, 0.96);
        } completion:^(BOOL finished) {
            _transitioning = NO;
        }];
        
     
    
        
    }

*/
    
    
    TodayViewController *today = [[TodayViewController alloc]init];
    today.TodayUrl = ((ProModel *)self.dataArray[indexPath.row]).api_url;
    
    [self presentViewController:today animated:YES completion:nil];
    [today release];

}


#pragma mark - Change slider
- (void)changeSlide
{
    if (_fullscreen == NO && _transitioning == NO) {
        if(_slide > _galleryImages.count-1) _slide = 0;
        
        UIImage *toImage = [UIImage imageNamed:_galleryImages[_slide]];
        [UIView transitionWithView:_mainView
                          duration:0.6f
                           options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationCurveEaseInOut
                        animations:^{
                            _topImage.image = toImage;
                            _reflected.image = toImage;
                        } completion:nil];
        _slide++;
    }
}


#pragma mark - UICollectionViewDelegateFlowLayout

#pragma mark - Gesture Interactions
- (void)doubleFingerTap:(UITapGestureRecognizer *)pinchGestureRecognizer
{
    
    if ([pinchGestureRecognizer state] == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            // Transform to zoom in effect
            _mainView.transform = CGAffineTransformScale(_mainView.transform, 0.96, 0.96);
        } completion:^(BOOL finished) {
            _transitioning = NO;
        }];
    } else if ([pinchGestureRecognizer state] == UIGestureRecognizerStateEnded) {
        // Reset scale
        _mainView.transform = CGAffineTransformMakeScale(1, 1);
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIViewControllerTransitioningDelegate
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
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
    _imageArray = nil;
    _dataArray = nil;
    [_pinch release];
    [_smallLayout release];
    [_largeLayout release];
    [_reflected release];
    [_topImage release];
    [_mainView release];
    [_collectionView release];
    [super dealloc];
}

@end
