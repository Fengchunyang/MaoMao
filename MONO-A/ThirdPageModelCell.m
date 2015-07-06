//
//  ThirdPageModelCell.m
//  First
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "ThirdPageModelCell.h"

@implementation ThirdPageModelCell
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
    self.imaView = [[UIImageView alloc]initWithFrame:CGRectMake(kSpace, 2 * kSpace, (370 - 2 * kSpace ) / 2, 100)];
    _imaView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.imaView];
    [_imaView release];
    
    
    
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(self.imaView.frame.origin.x + self.imaView.frame.size.width + kSpace, self.imaView.frame.origin.y, 370 - self.imaView.frame.size.width - 3 * kSpace, 30)];
    self.label1.backgroundColor = [UIColor whiteColor];
    self.label1.font = [UIFont systemFontOfSize:12];
    self.label1.textColor = [UIColor lightGrayColor];
    self.label1.numberOfLines = 0;
    [self.contentView addSubview:self.label1];
    [_label1 release];
    
    
    
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(self.label1.frame.origin.x, self.label1.frame.origin.y + self.label1.frame.size.height + kSpace, self.label1.frame.size.width, 50)];
    self.label2.backgroundColor = [UIColor whiteColor];
    self.label2.font = [UIFont systemFontOfSize:15];
    self.label2.numberOfLines = 0;
    [self.contentView addSubview:self.label2];
    [_label2 release];
    
    
    
}
- (void)calculateHeight
{
    NSString *contentText = self.label2.text;
    NSString *label1Text = self.label1.text;


    CGSize maxSize = CGSizeMake(self.label2.frame.size.width, 1000);
    CGSize maxSize2 = CGSizeMake(self.label1.frame.size.width, 1000);
    
    
    //自适应高度
    CGRect textRect = [contentText boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];

    CGRect textRect2 = [label1Text boundingRectWithSize:maxSize2 options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];

    
    
    //改变label的frame
    self.label1.frame = CGRectMake(self.label1.frame.origin.x, self.label1.frame.origin.y, self.label1.frame.size.width, textRect2.size.height);
    self.label2.frame = CGRectMake(self.label2.frame.origin.x, self.label1.frame.origin.y + self.label1.frame.size.height + 2 * kSpace, self.label2.frame.size.width, textRect.size.height);



    
    //改变cintentView的frame
    if (self.label2.frame.size.height > (self.imaView.frame.size.height - 2 * kSpace - self.label1.frame.size.height)) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.label1.frame.size.height + self.label2.frame.size.height + 5 * kSpace);

        
    }else
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,  self.imaView.frame.size.height  + 5 * kSpace ) ;
    }
    
    
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
