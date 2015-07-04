//
//  manhuaModel.h
//  mono
//
//  Created by 张浩杰 on 15-7-2.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface manhuaModel : NSObject

@property(nonatomic,retain)NSString * constr;
@property(nonatomic,retain)NSString * imageurl;
@property(nonatomic,retain)NSString * webstr;
-(id)initWithDictionary:(NSDictionary *)dic;


@end
