//
//  MagazineModel.h
//  MONO-A
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagazineModel : NSObject

-(id)initWithDictionary:(NSDictionary *)dic;
@property(nonatomic,retain)NSString * BIGimage;
@property(nonatomic,retain)NSString * conStr;
@property(nonatomic,retain)NSString * titleStr;
@property(nonatomic,retain)NSString * subStr;
@property(nonatomic,retain)NSString * linkStr1;
@property(nonatomic,retain)NSString * IntroStr;

@end
