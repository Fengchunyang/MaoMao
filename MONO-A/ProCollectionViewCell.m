//
//  ProCollectionViewCell.m
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ProCollectionViewCell.h"


@implementation ProCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        [self setupImageView];
        [self setupTextLabel];
        [self setupDetailTextLabel];
        
    }
    
    return self;
}

- (void)setProModel:(ProModel *)proModel
{
    _proModel = proModel;
    self.titleLabel.text =
    _proModel.title;
    
    [self setNeedsLayout];
}


- (void)setupTextLabel
{
    self.titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.titleLabel];
}

- (void)setupDetailTextLabel
{
    self.detailLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.detailLabel];
}

- (void)setupImageView
{
    self.backImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.backImageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(20, 20, self.frame.size.width, 80);
    CGRect detailFrame = CGRectOffset(self.titleLabel.frame, 0, 10);
    CGFloat height = [[self class]LabelTextHeight:self.detailLabel.text];
    detailFrame.size.height = height;
    self.detailLabel.frame = detailFrame;
    self.backImageView.frame = self.bounds;
    
    
}

+ (CGFloat)LabelTextHeight:(NSString *)text {
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(375 - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17.0f]} context:nil];
    return rectToFit.size.height;
}




@end
