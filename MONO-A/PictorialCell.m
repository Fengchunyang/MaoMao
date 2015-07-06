//
//  PictorialCell.m
//  MONO-B
//
//  Created by 张浩杰 on 15-6-29.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "PictorialCell.h"
#define K_TOP_MARGIN 10
#define K_LEFT_MARGIN 10
@implementation PictorialCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _BIGimage = [[UIImageView alloc] initWithFrame:CGRectMake(K_LEFT_MARGIN, K_TOP_MARGIN, 355, 200)];
       // self.BIGimage.backgroundColor = [UIColor yellowColor];
        
        [self.contentView addSubview:_BIGimage];
       
        _subimage = [[UIImageView alloc] initWithFrame:CGRectMake(K_LEFT_MARGIN, CGRectGetMaxY(_BIGimage.frame)+5, 30, 50)];
       // self.subimage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_subimage];
       
        
  
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_subimage.frame)+5, CGRectGetMaxY(_BIGimage.frame)+5, 320, 30)];
               // self.titleLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_titleLabel];
    
        _conLabel  = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_titleLabel.frame), CGRectGetMaxY(_titleLabel.frame)+5, 320, 50)];
        
       // self.conLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_conLabel];
        

        
        _subLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, 20)];
       // self.subLabel.backgroundColor = [UIColor blackColor];
        [_BIGimage addSubview:_subLabel];
        
        _aLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_subLabel.frame), 0, 40, 20)];
       // self.aLabel.backgroundColor = [UIColor redColor];
        [_BIGimage addSubview:_aLabel];
        
        _FromLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_aLabel.frame), 0, 70, 20)];
       // self.FromLabel.backgroundColor = [UIColor yellowColor];
        [_BIGimage addSubview:_FromLabel];
        
        
        [_aLabel release];
        [_FromLabel release];
        [_subLabel release];
        [_BIGimage release];
        [_conLabel release];
        [_titleLabel release];
        [_subimage release];
        
        
        
        
    }


    return self;

}
- (void)dealloc
{
    [_aLabel release];
    [_FromLabel release];
    [_subimage release];
    [_BIGimage release];
    [_conLabel release];
    [_titleLabel release];
    [_subLabel release];
    [super dealloc];
}

@end
