//
//  Pictorial2Model.m
//  MONO-A
//
//  Created by lanouhn on 15/7/1.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//
#import "Pictorial2Model.h"


@implementation PictorialModel : NSObject 

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            if (![[dic objectForKey:@"title"] isKindOfClass:[NSNull class]]) {
                
                self.title = dic[@"title"];
            }
            self.descrip = dic[@"description"];
            self.photo = [[PhotoModel alloc]initWithDictionary:dic[@"cover"]];
            self.access_url = dic[@"access_url"];
        }
        
    }
    return self;
}

@end
