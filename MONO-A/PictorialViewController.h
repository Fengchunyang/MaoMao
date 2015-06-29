//
//  PictorialViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictorialVIew.h"

#import "RPSlidingMenuCell.h"
#import "RPSlidingMenuLayout.h"

@interface PictorialViewController : UIViewController< UICollectionViewDataSource, UICollectionViewDelegate , RPSlidingMenuLayoutDelegate>

//@property (nonatomic , retain) PictorialVIew *pictorialView;

@property (nonatomic , retain) NSMutableArray *dataArray;

@property (nonatomic , retain) UICollectionView *collectView;

@property (nonatomic) CGFloat featureHeight;

@property (nonatomic) BOOL scrollsToCollapsedRowsOnSelection;

@property (nonatomic) CGFloat collapsedHeight;

@end
