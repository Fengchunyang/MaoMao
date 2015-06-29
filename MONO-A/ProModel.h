//
//  ProModel.h
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ProModel : NSObject

@property (nonatomic , retain) NSString *title;
@property (nonatomic , retain) NSString *api_url;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)shareProModel;

@end
