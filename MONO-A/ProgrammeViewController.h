//
//  ProgrammeViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgrammeVIew.h"

@interface ProgrammeViewController : UIViewController<UICollectionViewDataSource , UICollectionViewDelegate>

@property (nonatomic , retain) ProgrammeVIew *programmeView;

@property (nonatomic , retain) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *galleryImages;
@property (nonatomic, readonly, getter=isFullscreen) BOOL fullscreen;
@property (nonatomic, readonly, getter=isTransitioning) BOOL transitioning;

@end
