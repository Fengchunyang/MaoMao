//
//  manhuaTableViewCell.h
//  mono
//
//  Created by 张浩杰 on 15-7-2.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
@interface manhuaTableViewCell : UITableViewCell

@property(nonatomic,retain)EGOImageView * imageview;
@property(nonatomic,retain)UILabel * conlabel;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

  




@end
