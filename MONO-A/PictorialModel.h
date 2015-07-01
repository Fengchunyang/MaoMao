//
//  Pictorial2Model.h
//  MONO-A
//
//  Created by lanouhn on 15/7/1.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PhotoModel.h"
@interface PictorialModel : NSObject

@property (nonatomic , retain) NSString *title;
@property (nonatomic , retain) NSString *descrip;
@property (nonatomic , retain) PhotoModel *photo;
@property (nonatomic , retain) NSString *access_url;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
