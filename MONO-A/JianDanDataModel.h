//
//  JianDanDataModel.h
//  First
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JianDanDataModel : NSObject
@property (nonatomic , retain)NSString *url;
@property (nonatomic , retain)NSString *title;
@property (nonatomic , retain)NSString *content;
@property (nonatomic , retain)NSString *excerpt;
@property (nonatomic , retain)NSString *imaheUrl1;
@property (nonatomic , retain)NSString *imaheUrl2;
@property (nonatomic , retain)NSString *imaheUrl3;
@property (nonatomic , retain)NSString *imaheUrl4;

- (instancetype)initWithDiictionary:(NSDictionary *)dic;
@end
