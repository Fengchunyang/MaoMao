//
//  ProgramModel.m
//  MONO-B
//
//  Created by 张浩杰 on 15-6-25.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "ProgramModel.h"

@implementation ProgramModel

- (void)dealloc
{
    _title = nil;
    _desc = nil;
    _thumb_url = nil;
    _icon_url = nil;
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)dic
{
    self= [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            self.title = [dic objectForKey:@"name"];
            self.desc = [dic objectForKey:@"desc"];
            self.thumb_url = [dic objectForKey:@"thumb_url"];
            self.icon_url = [dic objectForKey:@"icon_url"];
        }
    }
    return self;
}


@end
