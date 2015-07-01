//
//  ViceChinaDataModel.m
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "ViceChinaDataModel.h"

@implementation ViceChinaDataModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            self.title = [dic objectForKey:@"title"];
            self.author = [dic objectForKey:@"author"];
            self.preview = [dic objectForKey:@"preview"];
            self.seriesTitle = [dic objectForKey:@"seriesTitle"];
            self.images = [dic objectForKey:@"image"];
        }
        
    }
    return self;
}
- (void)dealloc
{
    _author = nil;
    _title = nil;
    _preview = nil;
    _seriesTitle = nil;
    _images = nil;
    [super dealloc];
}
@end
