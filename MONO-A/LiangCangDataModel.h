//
//  LiangCangDataModel.h
//  First
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiangCangDataModel : NSObject
@property (nonatomic , retain)NSString *title;
@property (nonatomic , retain)NSString *Description;
@property (nonatomic , retain)NSString *imaURL;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
