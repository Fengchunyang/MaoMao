//
//  ZaoWuZhuModelCell.m
//  First
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "ZaoWuZhuModelCell.h"
#define kImageViewW 70
@implementation ZaoWuZhuModelCell
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
    
    
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    self.imaView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 25, kImageViewW, kImageViewW)];
//    self.imaView.backgroundColor = [UIColor purpleColor];
    
    self.imaView.layer.cornerRadius = kImageViewW / 2;
    self.imaView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:self.imaView];
    [self.imaView release];
    
    
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(self.imaView.frame.origin.x + self.imaView.frame.size.width + 3 *kSpace, self.imaView.frame.origin.y, self.contentView.frame.size.width - self.imaView.frame.size.width - 20 - 2 *kSpace - 20 , 30)];
//    self.label1.backgroundColor = [UIColor orangeColor];
    self.label1.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.label1];
    [self.label1 release];
    
    
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(self.label1.frame.origin.x, self.label1.frame.origin.y + self.label1.frame.size.height , self.label1.frame.size.width,60)];
//    self.label2.backgroundColor = [UIColor redColor];
    self.label2.numberOfLines = 0;
    self.label2.font = [UIFont systemFontOfSize:16];
    self.label2.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.label2];
    [self.label2 release];
    
    
    
    
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
    
    [_imaView release];
    [_label1 release];
    [_label2 release];
    [super dealloc];
}
@end
