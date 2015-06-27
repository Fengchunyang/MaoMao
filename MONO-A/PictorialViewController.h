//
//  PictorialViewController.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictorialVIew.h"

#import "ZZGallerySliderCell.h"
#import "ZZGallerySliderLayout.h"

@interface PictorialViewController : UIViewController<ZZGallerySliderCellDelegate, ZZGallerySliderLayoutDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

//@property (nonatomic , retain) PictorialVIew *pictorialView;

@property (nonatomic , retain) NSMutableArray *dataArray;


@end
