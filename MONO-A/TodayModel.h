//
//  TodayModel.h
//  MONO-A
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodayModel : NSObject

@property (nonatomic , retain) NSString *title;
@property (nonatomic , retain) NSString *auther_name;
@property (nonatomic , retain) NSString *full_url;
@property (nonatomic , retain) NSString *photo;
@property (nonatomic , retain) NSMutableArray *imageArray;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
