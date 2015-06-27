//
//  PhotoModel.h
//  MONO-A
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoModel : NSObject

@property (nonatomic , retain) NSString *url;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
