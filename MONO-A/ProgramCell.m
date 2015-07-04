//
//  ProgramCell.m
//  MONO-B
//
//  Created by 张浩杰 on 15-6-25.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "ProgramCell.h"

@implementation ProgramCell

- (void)dealloc
{    [_label release];
    [_introLabel release];
    [_photoView release];
    [super dealloc];
}

-(UIImageView *)photoView
{
    if (!_photoView) {
        self.photoView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
       // _photoView.placeholderImage = [UIImage imageNamed:@"03.png"];
        [self.contentView addSubview:_photoView];
        [_photoView release];
    }
    return _photoView;
}
-(UILabel *)label
{
    if (!_label) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 75)];
        [self.contentView addSubview:_label];
        [_label release];
    }
    return _label;
}

-(UILabel *)introLabel
{
    if (!_introLabel) {
        self.introLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 75, 150, 75)];
        [self.contentView addSubview:_introLabel];
        [_introLabel release];
    }
    return _introLabel;
}



@end
