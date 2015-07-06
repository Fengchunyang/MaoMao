//
//  TodayTableViewCell.m
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TodayTableViewCell.h"
#define kAuthorWidth 50
#define kAuthorHeight 30
#define kLeftLabelWidth 120
#define kLeftLabelHeight 30
#define kTitleLabelWidth 300
#define kTitleLabelHeight 100


@implementation TodayTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        self.height = 0;
        [self setUpView];
        [self setCellFrame];
    }
    return self;
}

- (void)setUpView
{
    self.leftLabel = [[UILabel alloc]init];
    self.leftLabel.backgroundColor = [UIColor clearColor];
    
    self.title = [[UILabel alloc]init];
    [self.title setTextColor:[UIColor orangeColor]];
    self.title.numberOfLines = 0;
    
    self.authorLabel = [[UILabel alloc]init];
    self.authorLabel.text = @"From";
    self.authorLabel.textAlignment = 1;
     [self.authorLabel setTextColor:[UIColor whiteColor]];
    self.authorLabel.backgroundColor = [UIColor orangeColor];
    
    self.topImageView = [[UIImageView alloc]init];
    self.topImageView.layer.cornerRadius = 4;
    self.topImageView.layer.masksToBounds = YES;
   
    [self.contentView addSubview:self.topImageView];
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.leftLabel];
    [_leftLabel release];
    [_title release];
    [_authorLabel release];
    [_topImageView release];
    
    
}

- (void)setCellFrame
{
    self.authorLabel.frame = CGRectMake(20, 10, kAuthorWidth, kAuthorHeight);
    self.leftLabel.frame = CGRectMake(CGRectGetMaxX(self.authorLabel.frame), 10, kLeftLabelWidth, kLeftLabelHeight);
    self.title.frame = CGRectMake(self.authorLabel.frame.origin.x + 20, CGRectGetMaxY(self.leftLabel.frame), kTitleLabelWidth, kTitleLabelHeight);
    self.topImageView.frame = CGRectMake(5, 5, kScreenBounds.size.width - 10, CGRectGetMaxY(self.title.frame));
    
    
}

- (UIImage *)zoomImage:(UIImage *)image
{
    CGSize size = image.size;
    UIGraphicsBeginImageContext(CGSizeMake(kScreenBounds.size.width, size.height*kScreenBounds.size.width/size.width));
    
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width*size.height/size.width)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

//- (void)setTodayModel:(TodayModel *)todayModel
//{
//    
//    _todayModel = todayModel;
//    
//    self.title.text = _todayModel.title;
//    self.leftLabel.text = _todayModel.auther_name;
//    
//    
//}

- (void)HeightForCell
{
    
    UIImage *image = self.topImageView.image;
    CGSize imageSize = image.size;
    if (image.size.width > self.topImageView.frame.size.width) {
        UIImage *newImage = [self zoomImage:image];
        imageSize = newImage.size;
    }
    self.topImageView.frame = CGRectMake(5, 5, kScreenBounds.size.width - 10, imageSize.height);
    self.height = self.topImageView.frame.size.height;

    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, imageSize.height);
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
