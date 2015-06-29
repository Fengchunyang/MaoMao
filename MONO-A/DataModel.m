//
//  DataModel.m
//  First
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if ( self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            
        
        self.ImageView = [[dic objectForKey:@"image"] objectForKey:@"raw"];
        
        self.title = [dic objectForKey:@"title"];
        
        self.text = [[dic objectForKey:@"text"] objectForKey:@"text"];
        NSString *str1 =[[dic objectForKey:@"user"]objectForKey:@"screen_name"];
        
        NSString *str2 = [[dic objectForKey:@"program" ]objectForKey:@"name"];
        self.label1Text = [NSString stringWithFormat:@"%@-%@" , str2 , str1];
        

        }
    }
    return self;
}








- (void)dealloc
{
    _label1Text = nil;
    _title = nil;
    _ImageView = nil;
    _text = nil;
    [super dealloc];
}
@end
