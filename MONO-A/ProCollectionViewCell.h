//
//  ProCollectionViewCell.h
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProModel.h"

@interface ProCollectionViewCell : UICollectionViewCell

@property (nonatomic , retain) ProModel *proModel;

@property (nonatomic , retain) UILabel *titleLabel;
@property (nonatomic , retain) UILabel *detailLabel;
@property (nonatomic , retain) UIImageView *backImageView;

@end
