//
//  TeaModel.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TeaModel : NSObject

@property (nonatomic , retain) NSString *title;
@property (nonatomic , retain) NSString *text;
@property (nonatomic , retain) NSString *image;
@property (nonatomic , retain) NSString *nextUrl;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
