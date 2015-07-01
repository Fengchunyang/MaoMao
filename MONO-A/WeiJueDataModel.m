//
//  WeiJueDataModel.m
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "WeiJueDataModel.h"

/*
 @property (nonatomic ,retain)NSString *title;
 @property (nonatomic ,retain)NSString *maketime;
 @property (nonatomic , retain)NSString *short_content;
 @property (nonatomic , retain)NSString *materal;
 @property (nonatomic , retain)NSString *kname;

 */
@implementation WeiJueDataModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            
        
        self.title = [dic objectForKey:@"title"];
        self.maketime = [dic objectForKey:@"maketime"];
        self.short_content = [dic objectForKey:@"short_content"];
        self.materal = [dic objectForKey:@"materal"];
        self.kname = [dic objectForKey:@"kname"];
            self.pic = [dic objectForKey:@"pic"];
            self.mainpic = [dic objectForKey:@"mainpic"];
    }
    }
    return self;
}
- (void)dealloc
{
    _pic = nil;
    _mainpic = nil;
    _title = nil;
    _maketime = nil;
    _short_content = nil;
    _materal = nil;
    _kname = nil;
    [super dealloc];
}

@end
