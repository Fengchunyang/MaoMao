//
//  PictorialCell.h
//  MONO-B
//
//  Created by 张浩杰 on 15-6-29.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictorialCell : UITableViewCell
@property(nonatomic,retain)UIImageView * BIGimage;
@property(nonatomic,retain)UILabel * conLabel;
@property(nonatomic,retain)UILabel * titleLabel;
@property(nonatomic,retain)UILabel * subLabel;
@property(nonatomic,retain)UIImageView * subimage;
@property(nonatomic,retain)UILabel * FromLabel;
@property(nonatomic,retain)UILabel * aLabel;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
