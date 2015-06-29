//
//  ProModel.m
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ProModel.h"

@implementation ProModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            self.title = dic[@"title"];
            self.api_url = dic[@"api_url"];
        }
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

+ (instancetype)shareProModel
{
    static ProModel *_shareProModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareProModel = [[ProModel alloc]init];
    });
    return _shareProModel;
}

@end
