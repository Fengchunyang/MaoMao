//
//  manhuaModel.m
//  mono
//
//  Created by 张浩杰 on 15-7-2.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "manhuaModel.h"

@implementation manhuaModel

-(id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.imageurl = [dic objectForKey:@"cover_image_url"];
        self.constr = [dic objectForKey:@"title"];
        self.webstr = [dic objectForKey:@"url"];
    }
    return self;

}

- (void)dealloc
{
    _webstr = nil;
    _imageurl = nil;
    _constr = nil;
    [super dealloc];
}

@end
