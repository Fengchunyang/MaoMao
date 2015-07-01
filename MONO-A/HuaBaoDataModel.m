//
//  HuaBaoDataModel.m
//  First
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "HuaBaoDataModel.h"

@interface HuaBaoDataModel ()

@end
@implementation HuaBaoDataModel
- (instancetype)initWithDistionary:(NSDictionary *)dic indexPath:(NSIndexPath *)indexPath
{
    self = [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            
        self.title = [dic objectForKey:@"title"];
        self.weburl = [dic objectForKey:@"weburl"];
            
            if (((NSArray *)[dic objectForKey:@"media"]).count > 0) {
                
                self.url = [[[dic objectForKey:@"media"]firstObject]objectForKey:@"url"];
                
            }
            

        self.auther_name = [dic objectForKey:@"auther_name"];
    }
}
    return self;

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
- (void)dealloc
{
    
    _auther_name = nil;
    _title = nil;
    _url = nil;
    _weburl = nil;
    [super dealloc];
}
@end
