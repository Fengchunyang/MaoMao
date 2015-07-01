//
//  ViceChinaDataModel.h
//  First
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViceChinaDataModel : NSObject
@property (nonatomic , retain)NSString *title;
@property (nonatomic , retain)NSString *preview;
@property (nonatomic , retain)NSString *images;
@property (nonatomic  ,retain)NSString * author;
@property (nonatomic , retain)NSString *seriesTitle;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
