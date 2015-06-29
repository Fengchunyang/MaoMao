//
//  TeaModel.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TeaModel.h"

@implementation TeaModel

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.title = [attributes valueForKeyPath:@"title"];
    return self;
}

@end
