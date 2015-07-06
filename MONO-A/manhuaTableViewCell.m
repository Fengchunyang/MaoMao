//
//  manhuaTableViewCell.m
//  mono
//
//  Created by 张浩杰 on 15-7-2.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "manhuaTableViewCell.h"

@implementation manhuaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageview = [[EGOImageView alloc] initWithFrame:CGRectMake(5, 10, 90, 70)];
        self.imageview.placeholderImage = [UIImage imageNamed:@"31.png"];
        //_imageview.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_imageview];
        self.conlabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imageview.frame)+5, CGRectGetMinY(_imageview.frame), self.contentView.frame.size.width - 15 - _imageview.frame.size.width ,_imageview.frame.size.height )];
       // _conlabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_conlabel];
        [self.imageview release];
        [self.conlabel release];
        
    }
    return self;

}

- (void)dealloc
{
    [_imageview release];
    [_conlabel release];
    [super dealloc];
}

@end
