//
//  JianDanDataModel.m
//  First
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "JianDanDataModel.h"

@implementation JianDanDataModel
- (instancetype)initWithDiictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            self.url = [dic objectForKey:@"url"];
            self.title = [dic objectForKey:@"title"];
            self.content = [dic objectForKey:@"content"];
            self.excerpt = [dic objectForKey:@"excerpt"];
        }
    }
    return self;
}
- (void)dealloc
{
    _url = nil;
    _title = nil;
    _content = nil;
    _excerpt = nil;
    [super dealloc];
}
@end
