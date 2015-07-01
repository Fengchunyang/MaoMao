//
//  PictorialModel.h
//  MONO-B
//
//  Created by 张浩杰 on 15-6-29.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pictorial2Model : NSObject
-(id)initWithDictionary:(NSDictionary *)dic;
@property(nonatomic,retain)NSString * BIGimage;
@property(nonatomic,retain)NSString * conStr;
@property(nonatomic,retain)NSString * titleStr;
@property(nonatomic,retain)NSString * subStr;
@property(nonatomic,retain)NSString * linkStr1;
@property(nonatomic,retain)NSString * IntroStr;

@end