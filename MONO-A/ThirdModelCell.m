//
//  ThirdModelCell.m
//  First
//
//  Created by lanouhn on 15/6/24.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "ThirdModelCell.h"

@implementation ThirdModelCell
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
    
     self.imaView = [[UIImageView alloc]initWithFrame:CGRectMake(kSpace + 2,2 * kSpace, 370 - 2 * kSpace, 200)];
    self.imaView.backgroundColor = [UIColor whiteColor];
    
    
    self.headView = [[UIImageView alloc]initWithFrame:CGRectMake(kSpace, self.imaView.frame.size.height + self.imaView.frame.origin.y + kSpace, 50, 80)];
    self.headView.image = [UIImage imageNamed:@"icon-hot"];
    self.headView.backgroundColor = [UIColor whiteColor];
    
    
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(self.headView.frame.origin.x + self.headView.frame.size.width + kSpace, self.headView.frame.origin.y, 370 - self.headView.frame.size.width - 3 * kSpace, 30)];
    self.label1.backgroundColor = [UIColor whiteColor];
    
    
    
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(self.label1.frame.origin.x, self.label1.frame.origin.y + self.label1.frame.size.height + kSpace , 370 - self.headView.frame.size.width - 3 * kSpace, 100)];
    self.label2.backgroundColor = [UIColor whiteColor];
    self.label2.font = [UIFont systemFontOfSize:13];
    self.label2.numberOfLines = 0;
    
    
    [self.contentView addSubview:self.label2];
    [self.label2 release];
    
    [self.contentView addSubview:self.imaView];
    [self.imaView release];
    
    [self.contentView addSubview:self.headView];
    [self.headView release];
    
    [self.contentView addSubview:self.label1];
    [self.label1 release];
    
}

- (void)calculateHeight
{
    NSString *contentText = self.label2.text;

    CGSize maxSize = CGSizeMake(self.label2.frame.size.width, 1000);
    
    
    
    //自适应高度
    CGRect textRect = [contentText boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];

    
    
    //改变label的frame
    self.label2.frame = CGRectMake(self.label2.frame.origin.x, self.label2.frame.origin.y, self.label2.frame.size.width, textRect.size.height);

   
    //改变cintentView的frame
    if (self.label2.frame.size.height > 0) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.imaView.frame.size.height + self.label1.frame.size.height + self.label2.frame.size.height + 5 * kSpace + 20);

    }else
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.imaView.frame.size.height + self.label1.frame.size.height + self.headView.frame.size.height + 5 * kSpace + 20 ) ;
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
    [_headView release];
    [_imaView release];
    [_label1 release];
    [_label2 release];
    [super dealloc];
    
}
@end
