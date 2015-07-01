//
//  HuaBaoDataModel.h
//  First
//
//  Created by lanouhn on 15/6/30.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HuaBaoDataModel : NSObject
@property (nonatomic , retain)NSString *weburl;
@property (nonatomic , retain)NSString *url;
@property (nonatomic , retain)NSString *title;
@property (nonatomic ,retain)NSString *auther_name;
- (instancetype)initWithDistionary:(NSDictionary *)dic indexPath:(NSIndexPath *)indexPath;
@end
