//
//  TeaTableViewCell.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TeaModel.h"

@interface TeaTableViewCell : UITableViewCell


@property (nonatomic , retain) UILabel *titleLabel;
@property (nonatomic , retain) UILabel *contentLabel;

@property (nonatomic , retain) TeaModel *teaModel;
+ (CGFloat)heightForCellWithTeaModel:(TeaModel *)model;
@end
