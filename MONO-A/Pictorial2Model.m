//
//  PictorialModel.m
//  MONO-B
//
//  Created by 张浩杰 on 15-6-29.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "Pictorial2Model.h"

@implementation Pictorial2Model

-(id)initWithDictionary:(NSDictionary *)dic
{
    self= [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            if (![[dic objectForKey:@"image"] isKindOfClass:[NSNull class]]) {
                
                self.BIGimage = [[dic objectForKey:@"image"] objectForKey:@"raw"];
            }
            self.conStr = [[dic objectForKey:@"text"]objectForKey:@"text" ];
            self.titleStr = [dic objectForKey:@"title"];
            self.subStr = [[dic objectForKey:@"program"] objectForKey:@"name"];
            self.linkStr1 = [dic objectForKey:@"link"];
            self.IntroStr = [[dic objectForKey:@"user"] objectForKey:@"screen_name"];
        }
        
       
    }
 
    return self;
}



- (void)dealloc
{
    _IntroStr = nil;
    _BIGimage = nil;
    _conStr =nil;
    _titleStr = nil;
    _linkStr1 = nil;
    _subStr = nil;
    [super dealloc];
}


@end
