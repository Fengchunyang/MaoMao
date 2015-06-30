//
//  TodayTableViewCell.m
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TodayTableViewCell.h"

@implementation TodayTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView
{
    self.leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, self.frame.size.width - 20, 50)];
    
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(20, self.leftLabel.frame.origin.y + self.leftLabel.frame.size.height + 10, self.frame.size.width - 20, 50)];
//    self.title.backgroundColor = [UIColor cyanColor];
    self.title.tintColor = [UIColor orangeColor];
    self.topImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    [self.contentView addSubview:self.leftLabel];
    [self.contentView addSubview:self.topImageView];
    [self.contentView addSubview:self.title];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTodayModel:(TodayModel *)todayModel
{
    
    _todayModel = todayModel;
    
    self.title.text = _todayModel.title;
    self.leftLabel.text = _todayModel.auther_name;
    
    //[self setNeedsLayout];
    
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    self.topImageView.frame = self.bounds;
//    self.leftLabel.frame = CGRectMake(self.frame.origin.x + 20, self.frame.origin.y + 20, self.frame.size.width - 20, 30);
//    self.title.frame = CGRectOffset(self.leftLabel.frame, 0, 10);
//}

@end
