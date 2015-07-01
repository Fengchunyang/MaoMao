//
//  WeiJueDataModel.h
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiJueDataModel : NSObject
@property (nonatomic ,retain)NSString *title;
@property (nonatomic ,retain)NSString *maketime;
@property (nonatomic , retain)NSString *short_content;
@property (nonatomic , retain)NSString *materal;
@property (nonatomic , retain)NSString *kname;
@property (nonatomic , retain)NSString *pic;
@property (nonatomic , retain)NSString *mainpic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
