//
//  PictorialModel.m
//  MONO-A
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PictorialModel.h"


@implementation PictorialModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            self.title = dic[@"title"];
            self.descrip = dic[@"description"];
            self.photo = [[PhotoModel alloc]initWithDictionary:dic[@"cover"]];
            self.access_url = dic[@"access_url"];
        }
        
    }
    return self;
}

@end
