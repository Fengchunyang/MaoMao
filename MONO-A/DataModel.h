//
//  DataModel.h
//  First
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 Feng Chunyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
@property (nonatomic , retain)NSString *ImageView;
@property (nonatomic , retain)NSString *title;
@property (nonatomic , retain)NSString *text;
@property (nonatomic , retain)NSString *label1Text;
- (instancetype)initWithDictionary:(NSDictionary *)dic
;
@end
