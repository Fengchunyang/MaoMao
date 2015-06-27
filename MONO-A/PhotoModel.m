//
//  PhotoModel.m
//  MONO-A
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PhotoModel.h"

@implementation PhotoModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]])
        {
            self.url = dic[@"url"];
        }
        
    }
    return self;
}

@end
