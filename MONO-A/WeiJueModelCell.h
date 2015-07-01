//
//  WeiJueModelCell.h
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 @property (nonatomic ,retain)NSString *title;
 @property (nonatomic ,retain)NSString *maketime;
 @property (nonatomic , retain)NSString *short_content;
 @property (nonatomic , retain)NSString *materal;
 @property (nonatomic , retain)NSString *kname;
 @property (nonatomic , retain)NSString *pic;
 @property (nonatomic , retain)NSString *mainpic;

 */
@interface WeiJueModelCell : UITableViewCell
@property (nonatomic  ,retain)UIImageView *picview;
@property (nonatomic , retain)UIImageView *mainpicView;
@property (nonatomic , retain)UILabel *titleLabel;
@property (nonatomic , retain)UILabel *maketimeLabel;
@property (nonatomic  ,retain)UILabel *short_contentLabel;
@property (nonatomic ,retain)UILabel *materalLabel;
@property (nonatomic , retain)UILabel *knameLabel;
- (void)calculateHeight;
@end
