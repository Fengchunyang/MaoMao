//
//  LiangCangDataModel.m
//  First
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "LiangCangDataModel.h"

@implementation LiangCangDataModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.title = [dic objectForKey:@"title"];
        self.Description = [dic objectForKey:@"description"];
        self.imaURL = [[dic objectForKey:@"cover"]objectForKey:@"url"];
    }
    return self;
}
- (void)dealloc
{
    _imaURL = nil;
    _Description = nil;
    _title = nil;
    [super dealloc];
}
@end
