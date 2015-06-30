//
//  TodayModel.m
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TodayModel.h"

@implementation TodayModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            self.title = dic[@"title"];
            self.auther_name = dic[@"auther_name"];
            self.full_url = dic[@"full_url"];
            
            self.imageArray = [NSMutableArray array];
            
        }
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}


@end
