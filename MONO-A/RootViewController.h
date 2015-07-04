//
//  RootViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SLNavigationSideItemsStyle) {
    SLNavigationSideItemsStyleOnBounds = 20,
    SLNavigationSideItemsStyleClose = 70,
    SLNavigationSideItemsStyleNormal = 80,
    SLNavigationSideItemsStyleFar = 90,
    SLNavigationSideItemsStyleDefault = 60,
    SLNavigationSideItemsStyleCloseToEachOne = 100
};

typedef void(^SLPagingViewMoving)(NSArray *subviews);
typedef void(^SLPagingViewMovingRedefine)(UIScrollView * scrollView, NSArray *subviews);
typedef void(^SLPagingViewDidChanged)(NSInteger currentPage);





@interface RootViewController : UIViewController

@property (nonatomic, copy) SLPagingViewMovingRedefine pagingViewMovingRedefine;

@property (nonatomic, copy) SLPagingViewMoving pagingViewMoving;

@property (nonatomic, copy) SLPagingViewDidChanged didChangedPage;

@property (nonatomic, retain) NSMutableDictionary *viewControllers;

@property (nonatomic, retain) UIColor *tintPageControlColor;

@property (nonatomic, retain) UIColor *currentPageControlColor;


@property (nonatomic) SLNavigationSideItemsStyle navigationSideItemsStyle;

-(id)initWithNavBarItems:(NSArray*)items views:(NSArray*)views;


-(id)initWithNavBarItems:(NSArray*)items views:(NSArray*)views showPageControl:(BOOL)addPageControl;

-(id)initWithNavBarItems:(NSArray*)items navBarBackground:(UIColor*)background views:(NSArray*)views showPageControl:(BOOL)addPageControl;

-(id)initWithNavBarControllers:(NSArray*)controllers;


-(id)initWithNavBarControllers:(NSArray*)controllers showPageControl:(BOOL)addPageControl;


-(id)initWithNavBarControllers:(NSArray*)controllers navBarBackground:(UIColor*)background showPageControl:(BOOL)addPageControl;


-(id)initWithNavBarItems:(NSArray*)items controllers:(NSArray*)controllers;

-(id)initWithNavBarItems:(NSArray*)items controllers:(NSArray*)controllers showPageControl:(BOOL)addPageControl;

-(id)initWithNavBarItems:(NSArray*)items navBarBackground:(UIColor*)background controllers:(NSArray*)controllers showPageControl:(BOOL)addPageControl;

-(void)updateUserInteractionOnNavigation:(BOOL)activate;


-(void)setCurrentIndex:(NSInteger)index animated:(BOOL)animated;

-(void)addViewControllers:(UIViewController *) controller needToRefresh:(BOOL) refresh;

@end

extern NSString* const SLPagingViewPrefixIdentifier; 

@interface SLPagingViewControllerSegueSetController : UIStoryboardSegue


@end
