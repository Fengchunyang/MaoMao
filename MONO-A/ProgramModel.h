//
//  ProgramModel.h
//  MONO-B
//
//  Created by 张浩杰 on 15-6-25.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgramModel : NSObject
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * desc;
@property(nonatomic,retain)NSString * thumb_url;//底层图片
@property(nonatomic,retain)NSString * icon_url;//上层图片//透明

-(id)initWithDictionary:(NSDictionary *)dic;

@end
