//
//  ButtonView.m
//  mono
//
//  Created by 张浩杰 on 15-7-2.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "ButtonView.h"

@implementation ButtonView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tupian = [[EGOImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 240) ];
        //_tupian.image = [UIImage imageNamed:@"mang.png"];
        UILabel * alabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 240)];
        alabel.backgroundColor = [UIColor blackColor];
        alabel.alpha = 0.5;
        UILabel * blabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 130, 50)];
        blabel.backgroundColor = [UIColor blackColor];
        blabel.alpha = 0.2;
        blabel.text = @"小8推荐";
        blabel.textColor = [UIColor whiteColor];
        blabel.font = [UIFont systemFontOfSize:35.0];
       
        
        [self.tupian addSubview:alabel];
      
        [self.tupian  addSubview:blabel];
        
        [self addSubview:_tupian];
        
        
        
        UILabel * conlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 240, frame.size.width, 30)];
         conlabel.text = @"内容";
        conlabel.textAlignment = NSTextAlignmentCenter;
        conlabel.backgroundColor = [UIColor whiteColor];
        UILabel * conlabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 270, frame.size.width, 30)];
        conlabel2.text = @"专题列表";
        conlabel2.textAlignment = NSTextAlignmentCenter;
        conlabel2.backgroundColor = [UIColor whiteColor];
        [self addSubview:conlabel];
        [self addSubview:conlabel2];
        
        
        
        
        
    }

    return self;
}


@end
