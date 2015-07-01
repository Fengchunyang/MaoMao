//
//  WeiJueModelCell.m
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "WeiJueModelCell.h"
/*
 @property (nonatomic ,retain)NSString *title;
 @property (nonatomic ,retain)NSString *maketime;
 @property (nonatomic , retain)NSString *short_content;
 @property (nonatomic , retain)NSString *materal;
 @property (nonatomic , retain)NSString *kname;
 @property (nonatomic , retain)NSString *pic;
 @property (nonatomic , retain)NSString *mainpic;
 
 */
@implementation WeiJueModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews
{
    self.picview = [[UIImageView alloc]initWithFrame:CGRectMake (2 * kSpace,2 * kSpace, 370 - 3 * kSpace, 200)];
    self.picview.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.picview];
    
    
    self.mainpicView = [[UIImageView alloc]initWithFrame:CGRectMake(self.picview.frame.origin.x, self.picview.frame.origin.y + self.picview.frame.size.height + kSpace, self.picview.frame.size.width, self.picview.frame.size.height)];
    self.mainpicView.backgroundColor = [UIColor grayColor];
     [self.contentView addSubview:self.mainpicView];
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.mainpicView.frame.origin.x, self.mainpicView.frame.origin.y + self.mainpicView.frame.size.height + kSpace, self.mainpicView.frame.size.width, 30)];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
     [self.contentView addSubview:self.titleLabel];
    
    
    self.short_contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + kSpace, self.titleLabel.frame.size.width, 60)];
    self.short_contentLabel.numberOfLines = 0;
    self.short_contentLabel.backgroundColor =  [UIColor whiteColor];
    self.short_contentLabel.font = [UIFont systemFontOfSize:16];
    self.short_contentLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.short_contentLabel];
    
    
    self.maketimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.short_contentLabel.frame.origin.x, self.short_contentLabel.frame.origin.y + self.short_contentLabel.frame.size.height + kSpace, self.titleLabel.frame.size.width, 30)];
    self.maketimeLabel.backgroundColor = [UIColor whiteColor];
    self.maketimeLabel.font = [UIFont systemFontOfSize:16];
    self.maketimeLabel.textColor = [UIColor grayColor];
   
    [self.contentView addSubview:self.maketimeLabel];
    
    self.materalLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.maketimeLabel.frame.origin.x, self.maketimeLabel.frame.origin.y + self.maketimeLabel.frame.size.height + kSpace, self.maketimeLabel.frame.size.width, 50)];
    self.materalLabel.backgroundColor = [UIColor whiteColor];
     self.materalLabel.numberOfLines = 0;
    [self.contentView addSubview:self.materalLabel];
    
    
    self.knameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,  10, self.materalLabel.frame.size.width, 30)];
    
    self.knameLabel.backgroundColor = [UIColor clearColor];
    self.knameLabel.font = [UIFont systemFontOfSize:30];
    self.knameLabel.textColor = [UIColor greenColor];
    
    [self.picview addSubview:self.knameLabel];
    
    
    
    
    
    
    
    [self.mainpicView release];
    [self.materalLabel release];
    [self.titleLabel release];
    [self.knameLabel release];
    [self.short_contentLabel release];
    [self.picview release];
    [self.maketimeLabel release];
    
    
}

- (void)calculateHeight
{
        NSString *short_contentLabelText = self.short_contentLabel.text;
    NSString *materal = self.materalLabel.text;
    
    CGSize maxSize = CGSizeMake(self.short_contentLabel.frame.size.width, 1000);
    CGRect textRect = [short_contentLabelText boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    CGRect textRect2 = [materal boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    
    
    self.short_contentLabel.frame = CGRectMake(self.short_contentLabel.frame.origin.x, self.short_contentLabel.frame.origin.y, self.short_contentLabel.frame.size.width, textRect.size.height) ;
    
    self.materalLabel.frame = CGRectMake(self.materalLabel.frame.origin.x, self.materalLabel.frame.origin.y, self.materalLabel.frame.size.width, textRect2.size.height);
    
    self.frame = CGRectMake(self.frame.origin.x , self.frame.origin.y, self.frame.size.width, self.maketimeLabel.frame.size.height + self.materalLabel.frame.size.height + self.mainpicView.frame.size.height + self.titleLabel.frame.size.height + self.picview.frame.size.height + self.knameLabel.frame.size.height + self.short_contentLabel.frame.size.height + 7 * kSpace + 30);
    

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [_titleLabel release];
    [_mainpicView release];
    [_short_contentLabel release];
    [_materalLabel release];
    [_knameLabel release];
    [_picview release];
    [_maketimeLabel release];
    [super dealloc];
    
    
}

@end
