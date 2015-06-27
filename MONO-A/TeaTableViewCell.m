//
//  TeaTableViewCell.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TeaTableViewCell.h"
#define kAllWidth [UIScreen mainScreen].bounds.size.width - 20
#define kTeaImageViewHeight 100
#define kTitleLabelHeight 20
#define kContentLabelHeight 40
#define kSpace 10

@implementation TeaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


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
    
    
//    self.teaImageView = [[EGOImageView alloc]initWithFrame:CGRectMake(self.frame.origin.x + 10, self.frame.origin.y, kAllWidth, kTeaImageViewHeight)];
//    self.teaImageView.backgroundColor = [UIColor yellowColor];
//    [self.contentView addSubview:self.teaImageView];
//    
//    
//    self.titleLabel = [Function createLabelWithFrame:CGRectMake(self.teaImageView.frame.origin.x, self.teaImageView.frame.size.height + kSpace, kAllWidth, kTitleLabelHeight) name:nil];
//    self.titleLabel.backgroundColor = [UIColor orangeColor];
//    self.titleLabel.font = [UIFont systemFontOfSize:20];
//    [self.contentView addSubview:self.titleLabel];
//    
//    self.contentLabel = [Function createLabelWithFrame:CGRectMake(self.teaImageView.frame.origin.x,self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + kSpace , kAllWidth, kContentLabelHeight) name:nil];
//    self.contentLabel.backgroundColor = [UIColor purpleColor];
//    [self.contentView addSubview:self.contentLabel];
    
    
    
//    self.teaImageView = [[EGOImageView alloc]init];
//    self.teaImageView.backgroundColor = [UIColor yellowColor];
//    [self.contentView addSubview:self.teaImageView];
    
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.backgroundColor = [UIColor orangeColor];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.titleLabel];
    
    self.contentLabel = [[UILabel alloc]init];
    self.contentLabel.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:self.contentLabel];

    
}

- (void)setTeaModel:(TeaModel *)teaModel
{
    _teaModel = teaModel;
    self.titleLabel.text = _teaModel.title;
    self.contentLabel.text = _teaModel.text;
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForCellWithTeaModel:(TeaModel *)model {
    return (CGFloat)fmaxf(70.0f, (float)[self LabelTextHeight:model.text] + 45.0f);
}

+ (CGFloat)LabelTextHeight:(NSString *)text {
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(375 - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17.0f]} context:nil];
    return rectToFit.size.height;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(10, 0, 375 - 20, kTitleLabelHeight);
    CGRect contectFrame = CGRectOffset(self.titleLabel.frame, 0, 10);
    
    CGFloat calculatedHeight = [[self class]LabelTextHeight:self.teaModel.text];
    
    contectFrame.size.height = calculatedHeight;
    
    self.contentLabel.frame = contectFrame;
}

@end
