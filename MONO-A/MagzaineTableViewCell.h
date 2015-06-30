//
//  MagzaineTableViewCell.h
//  MONO-A
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagzaineTableViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView * BIGimage;
@property(nonatomic,retain)UILabel * conLabel;
@property(nonatomic,retain)UILabel * titleLabel;
@property(nonatomic,retain)UILabel * subLabel;
@property(nonatomic,retain)UIImageView * subimage;
@property(nonatomic,retain)UILabel * FromLabel;
@property(nonatomic,retain)UILabel * aLabel;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
