//
//  RootViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"


#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size

@interface RootViewController ()<UIScrollViewDelegate>


@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl *pageControl;
@property (nonatomic, retain) UIView *navigationBarView;
@property (nonatomic, retain) NSMutableArray *subviews;
@property (nonatomic) BOOL needToShowPageControl;
@property (nonatomic) BOOL isUserInteraction;
@property (nonatomic) NSInteger indexSelected;
@property (nonatomic , assign) CGFloat scrollViewOffsize;

@property (nonatomic , retain) UIView *lineView;
@property (nonatomic , retain) UIView *view1;

@end

@implementation RootViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self initCrucialObjects:[UIColor whiteColor]];
    }
    return self;
}

#pragma mark - constructors with views

-(id)initWithNavBarItems:(NSArray*) items views:(NSArray*)views{
    return [self initWithNavBarItems:items
                    navBarBackground:[UIColor whiteColor]
                               views:views
                     showPageControl:YES];
}

-(id)initWithNavBarItems:(NSArray*)items views:(NSArray*)views showPageControl:(BOOL)addPageControl{
    return [self initWithNavBarItems:items
                    navBarBackground:[UIColor whiteColor]
                               views:views
                     showPageControl:addPageControl];
}

// initWithNavBarItems:(NSArray *)items navBarBackground:(UIColor *)background controllers:(NSArray *)controllers showPageControl:(BOOL)addPageControl

-(id)initWithNavBarItems:(NSArray*)items navBarBackground:(UIColor*)background views:(NSArray*)views showPageControl:(BOOL)addPageControl{
    self = [super init];
    if(self){
        [self initCrucialObjects:background];
        int i                         = 0;
        for(i=0; i<items.count; i++){
            // Be sure items contains only UIView's object
            if([[items objectAtIndex:i] isKindOfClass:UIView.class])
                [self addNavigationItem:[items objectAtIndex:i] tag:i];
        }
        
        // is there any controllers ?
        if(views
           && views.count > 0){
            NSMutableArray *controllerKeys = [NSMutableArray new];
            for(i=0; i < views.count; i++){
                if([[views objectAtIndex:i] isKindOfClass:UIView.class]){
                    UIView *ctr = [views objectAtIndex:i];
                    // Set the tag
                    ctr.tag = i;
                    [controllerKeys addObject:@(i)];
                }
                else if([[views objectAtIndex:i] isKindOfClass:UIViewController.class]){
                    UIViewController *ctr = [views objectAtIndex:i];
                    // Set the tag
                    ctr.view.tag = i;
                    [controllerKeys addObject:@(i)];
                }
            }
            
            
            // Number of keys equals number of controllers ?
            if(controllerKeys.count == views.count)
                _viewControllers = [[NSMutableDictionary alloc] initWithObjects:views
                                                                        forKeys:controllerKeys];
            else{
                // Something went wrong -> inform the client
                NSException *exc = [[NSException alloc] initWithName:@"View Controllers error"
                                                              reason:@"Some objects in viewControllers are not kind of UIViewController!"
                                                            userInfo:nil];
                @throw exc;
                
            }
        }
    }
    
    
    return self;
}

#pragma mark - constructors with controllers

-(id)initWithNavBarControllers:(NSArray *)controllers{
    return [self initWithNavBarControllers:controllers
                          navBarBackground:[UIColor whiteColor]
                           showPageControl:YES];
}

-(id)initWithNavBarControllers:(NSArray *)controllers showPageControl:(BOOL)addPageControl{
    return [self initWithNavBarControllers:controllers
                          navBarBackground:[UIColor whiteColor]
                           showPageControl:addPageControl];
}

-(id)initWithNavBarControllers:(NSArray *)controllers navBarBackground:(UIColor *)background showPageControl:(BOOL)addPageControl{
    NSMutableArray *views = [[NSMutableArray alloc] initWithCapacity:controllers.count];
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:controllers.count];
    for(int i =0; i<controllers.count; i++){
        // Be sure we got s subclass of UIViewController
        if([controllers[i] isKindOfClass:UIViewController.class]){
            UIViewController *ctr = controllers[i];
            [views addObject:[ctr view]];
            // Get associated item
            UILabel *item = [UILabel new];
            [item setText:ctr.title];
            [items addObject:item];
            [item release];
        }
    }
    return [self initWithNavBarItems:items
                    navBarBackground:background
                               views:views
                     showPageControl:addPageControl];
}

#pragma mark - constructors with items & controllers

-(id)initWithNavBarItems:(NSArray *)items controllers:(NSArray *)controllers{
    return [self initWithNavBarItems:items
                    navBarBackground:nil
                         controllers:controllers
                     showPageControl:YES];
}

-(id)initWithNavBarItems:(NSArray *)items controllers:(NSArray *)controllers showPageControl:(BOOL)addPageControl{
    return [self initWithNavBarItems:items
                    navBarBackground:[UIColor whiteColor]
                         controllers:controllers
                     showPageControl:addPageControl];
}

-(id)initWithNavBarItems:(NSArray *)items navBarBackground:(UIColor *)background controllers:(NSArray *)controllers showPageControl:(BOOL)addPageControl{
    NSMutableArray *views = [[NSMutableArray alloc] initWithCapacity:controllers.count];
    for(int i =0; i<controllers.count; i++){
        // Be sure we got s subclass of UIViewController
        if([controllers[i] isKindOfClass:UIViewController.class])
            [views addObject:(UIViewController*)controllers[i]];
    }
    return [self initWithNavBarItems:items
                    navBarBackground:background
                               views:views
                     showPageControl:addPageControl];
    
}

#pragma mark - LifeCycle

- (void)loadView {
    [super loadView];
    // Try to load controller from storyboard
    [self loadStoryboardControllers];
    // Set up the controller
    [self setupPagingProcess];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.scrollViewOffsize = self.indexSelected*375;
    [self setCurrentIndex:self.indexSelected
                 animated:NO];
    
   
    [self prefersStatusBarHidden];
}

- (BOOL)prefersStatusBarHidden
{
    return YES; // 返回NO表示要显示，返回YES将hiden
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.navigationBarView.frame = (CGRect){0, 0, SCREEN_SIZE.width, 44};
}

#pragma mark - public methods

-(void)updateUserInteractionOnNavigation:(BOOL)activate{
    self.isUserInteraction = activate;
}

-(void)setCurrentIndex:(NSInteger)index animated:(BOOL)animated{
    // Be sure we got an existing index
    if(index < 0 || index > self.navigationBarView.subviews.count-1){
        NSException *exc = [[NSException alloc] initWithName:@"Index out of range"
                                                      reason:@"The index is out of range of subviews's count!"
                                                    userInfo:nil];
        @throw exc;
    }
    // save current index
    self.indexSelected = index;
    // Get the right position and update it
    CGFloat xOffset    = (index * ((int)SCREEN_SIZE.width));
    [self.scrollView setContentOffset:CGPointMake(xOffset, self.scrollView.contentOffset.y) animated:animated];
    
    
}

#pragma mark 把控制器的view作为字典的value  不走
-(void)addViewControllers:(UIViewController *) controller needToRefresh:(BOOL) refresh{
    int tag = (int)self.viewControllers.count;
    // Try to get a navigation item
    UIView *v = nil;
    if(controller.title){
        UILabel *item = [UILabel new];
        [item setText:controller.title];
        v = item;
        [item release];
    }
    else if(controller.navigationItem && controller.navigationItem.titleView){
        v = controller.navigationItem.titleView;
    }
    // Adds a navigation item
    [self addNavigationItem:v
                        tag:tag];
    // Save the controller
    [self.viewControllers setObject:controller
                             forKey:@(tag)];
    // Do we need to refresh the UI ?
    if(refresh)
        [self setupPagingProcess];
}

#pragma mark - Internal methods

-(void) initCrucialObjects:(UIColor *)background{
    _needToShowPageControl             = NO;
    _navigationBarView                 = [[UIView alloc] init];
    _navigationBarView.backgroundColor = background;
    // UserInteraction activate by default
    _isUserInteraction                 = YES;
    // Default value for the navigation style
    _navigationSideItemsStyle          = SLNavigationSideItemsStyleDefault;
    _viewControllers                   = [NSMutableDictionary new];
    _subviews                          = [NSMutableArray new];
}

// Load any defined controllers from the storyboard
- (void)loadStoryboardControllers
{
    if (self.storyboard)
    {
        BOOL isThereNextIdentifier = YES;
        int idx = 0;
        while (isThereNextIdentifier) {
            @try
            {
                [self performSegueWithIdentifier:[NSString stringWithFormat:@"%@%d", SLPagingViewPrefixIdentifier, idx]
                                          sender:nil];
                idx++;
            }
            @catch(NSException *exception) {
                isThereNextIdentifier = NO;
            }
        }
    }
}

// Add a view as a navigationBarItem
#pragma mark 修改Item
-(void)addNavigationItem:(UIView*)v tag:(int)tag{
    CGFloat distance            = (SCREEN_SIZE.width/2) - self.navigationSideItemsStyle;
    //原本的
    //    CGSize vSize                = ([v isKindOfClass:[UILabel class]])? [self getLabelSize:(UILabel*)v] : v.frame.size;
    CGSize vSize                = v.frame.size;
    CGFloat originX             = (SCREEN_SIZE.width/2 - vSize.width/2) + self.subviews.count*distance;
    // Item 距离顶部的高度  原来是8
    v.frame                     = (CGRect){originX, 0, vSize.width, vSize.height};
    v.tag                       = tag;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tapOnHeader:)];
    
    
    // 给label 添加颜色
    if (([v isKindOfClass:[UILabel class]])) {
        ((UILabel *)v).textColor = [UIColor orangeColor];
        ((UILabel *)v).font = [UIFont systemFontOfSize:17];
    }
    
    
    [v addGestureRecognizer:tap];
    [v setUserInteractionEnabled:YES];
    [tap release];
    
    [_navigationBarView addSubview:v];
    if(!_subviews)
        _subviews = [[NSMutableArray alloc] init];
    
    
    
    [_subviews addObject:v];
    
    [v release];
}

#pragma mark - 添加item
-(void)setupPagingProcess{
    // Make our ScrollView
    CGRect frame                                   = CGRectMake(0, 0, SCREEN_SIZE.width, self.view.frame.size.height);
    self.scrollView                                = [[UIScrollView alloc] initWithFrame:frame];
    self.scrollView.backgroundColor                = [UIColor clearColor];
    self.scrollView.pagingEnabled                  = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator   = NO;
    self.scrollView.delegate                       = self;
    self.scrollView.bounces                        = NO;
    [self.scrollView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.view addSubview:self.scrollView];
    [_scrollView release];
    
    // Adds all views
    [self addControllers];
    
    if(self.needToShowPageControl){
        // Make the page control
        self.pageControl               = [[UIPageControl alloc] init];
        self.pageControl.frame         = (CGRect){0, 35, 0, 0};
        self.pageControl.numberOfPages = self.navigationBarView.subviews.count;
        self.pageControl.currentPage   = 0;
        if(self.currentPageControlColor) self.pageControl.currentPageIndicatorTintColor = self.currentPageControlColor;
        if(self.tintPageControlColor) self.pageControl.pageIndicatorTintColor = self.tintPageControlColor;
        [self.navigationBarView addSubview:self.pageControl];
        [_pageControl release];
    }
    [self.navigationController.navigationBar addSubview:self.navigationBarView];
    [_navigationBarView release];
}

// Add all views
#pragma mark - Add all views
-(void)addControllers{
    if(self.viewControllers
       && self.viewControllers.count > 0){
        float width                 = SCREEN_SIZE.width * self.viewControllers.count;
        float height                = CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.navigationBarView.frame);
        self.scrollView.contentSize = (CGSize){width, height};
        
        
        // 字典没有排序
        
        
        //        __block int i               = 0;
        //        [self.viewControllers enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        //            UIView *v = [self.viewControllers objectForKey:key];
        //            v.frame   = (CGRect){SCREEN_SIZE.width * i, 0, SCREEN_SIZE.width, CGRectGetHeight(self.view.frame)};
        //            [self.scrollView addSubview:v];
        //            NSLog(@"%ld , %@", v.tag, NSStringFromCGRect(v.frame));
        //            i++;
        //        }];
        
        NSArray *arr = [[self.viewControllers allKeys] sortedArrayUsingSelector:@selector(compare:)];
        
        
        for (int i = 0; i < arr.count; i++) {
            UIViewController *v = [self.viewControllers objectForKey:arr[i]];
            v.view.frame   = (CGRect){SCREEN_SIZE.width * i, 0, SCREEN_SIZE.width, CGRectGetHeight(self.view.frame)};
            [self.scrollView addSubview:v.view];
            [self addChildViewController:v];
            [v didMoveToParentViewController:self];
              
        }
        
        
    }
}

// Scroll to the view tapped
-(void)tapOnHeader:(UITapGestureRecognizer *)recognizer{
    if(self.isUserInteraction){
        // Get the wanted view
        UIViewController *view = [self.viewControllers objectForKey:@(recognizer.view.tag)];
        NSInteger a = (NSInteger)self.scrollViewOffsize/375;
        UIView *view1 =  self.subviews[a];
        UIView *view2 = self.subviews[recognizer.view.tag];
        if (![view2 isEqual:view1]) {
         UIView *line1 =  [[view1 subviews]firstObject];
            line1.hidden = YES;
            UIView *line2 = [[view2 subviews]firstObject];
            line2.hidden = NO;
        }
        [self.scrollView scrollRectToVisible:view.view.frame
                                    animated:YES];
        
        
        self.scrollViewOffsize = recognizer.view.tag*375;
        
    }
    
    
    
}

-(CGSize) getLabelSize:(UILabel *)lbl{
    return [[lbl text] sizeWithAttributes:@{NSFontAttributeName:[lbl font]}];;
}

#pragma mark - SLPagingViewDidChanged delegate

-(void)sendNewIndex:(UIScrollView *)scrollView{
    CGFloat xOffset              = scrollView.contentOffset.x;
    int currentIndex             = ((int) roundf(xOffset) % (self.navigationBarView.subviews.count * (int)SCREEN_SIZE.width)) / SCREEN_SIZE.width;
    if (self.pageControl.currentPage != currentIndex)
    {
        self.pageControl.currentPage = currentIndex;
        if(self.didChangedPage)
            self.didChangedPage(currentIndex);
    }
}

#pragma mark - ScrollView delegate


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat xOffset = scrollView.contentOffset.x;
    int i = 0;
    for(UIView *v in self.subviews){
        CGFloat distance = (SCREEN_SIZE.width/2) - self.navigationSideItemsStyle;
        // 原来的
        //        CGSize vSize     = ([v isKindOfClass:[UILabel class]])? [self getLabelSize:(UILabel*)v] : v.frame.size;
        CGSize vSize     =  v.frame.size;
        CGFloat originX  = ((SCREEN_SIZE.width/2 - vSize.width/2) + i*distance) - xOffset/(SCREEN_SIZE.width/distance);
        
        // Item 距离顶部的高度  原来是8
        v.frame          = (CGRect){originX, 0, vSize.width, vSize.height};
        i++;
    }
    if(self.pagingViewMoving)
        // Customize the navigation items
        self.pagingViewMoving(self.subviews);
    if(self.pagingViewMovingRedefine)
        // Wants to redefine all behaviors
        self.pagingViewMovingRedefine(scrollView, self.subviews);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    CGFloat a = scrollView.contentOffset.x/375;
    self.view1 = self.subviews[(NSInteger)a];
    self.lineView = [[self.view1 subviews]firstObject];
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self sendNewIndex:scrollView];
    
    self.scrollViewOffsize = scrollView.contentOffset.x;

    CGFloat a = scrollView.contentOffset.x/375;
    UIView *v = self.subviews[(NSInteger)a];
    UIView *line = [[v subviews]firstObject];
    if (self.view1.frame.origin.x != v.frame.origin.x) {
        self.lineView.hidden = YES;
    }
    line.hidden = NO;
    
    
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self sendNewIndex:scrollView];
}
/*
 
 @property (nonatomic, strong) UIScrollView *scrollView;
 @property (nonatomic, strong) UIPageControl *pageControl;
 @property (nonatomic, strong) UIView *navigationBarView;
 @property (nonatomic, strong) NSMutableArray *subviews;
 @property (nonatomic) BOOL needToShowPageControl;
 @property (nonatomic) BOOL isUserInteraction;
 @property (nonatomic) NSInteger indexSelected;
 @property (nonatomic , assign) CGFloat scrollViewOffsize;
 
 @property (nonatomic , retain) UIView *lineView;
 @property (nonatomic , retain) UIView *view1;
 
 
 @property (nonatomic, copy) SLPagingViewMovingRedefine pagingViewMovingRedefine;
 
 @property (nonatomic, copy) SLPagingViewMoving pagingViewMoving;
 
 @property (nonatomic, copy) SLPagingViewDidChanged didChangedPage;
 
 @property (nonatomic, strong) NSMutableDictionary *viewControllers;
 
 @property (nonatomic, strong) UIColor *tintPageControlColor;
 
 @property (nonatomic, strong) UIColor *currentPageControlColor;
 
 */
- (void)dealloc
{
    
    
    _viewControllers = nil;
    [_currentPageControlColor release];
    [_tintPageControlColor release];
    [_scrollView release];
    [_pageControl release];
    [_navigationBarView release];
    [_subviews release];
    [_lineView release];
    [_view1 release];
    [super dealloc];
}


@end

#pragma mark - SLPagingViewControllerSegueSetController segue identifier's prefix

NSString * const SLPagingViewPrefixIdentifier = @"sl_";

#pragma mark - SLPagingViewControllerSegueSetController class

@implementation SLPagingViewControllerSegueSetController

#pragma mark - addViewControllers
-(void)perform{
    // Get SLPagingViewController (sourceViewController)
    RootViewController *src = self.sourceViewController;
    // Add it to the subviews
    if(self.destinationViewController)
        
        
        [src addViewControllers:self.destinationViewController
                  needToRefresh:NO];
}












@end
