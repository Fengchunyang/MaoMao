//
//  Data handling.h
//  MONO-B
//
//  Created by 张浩杰 on 15-6-25.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Data_handling;
@protocol DatahandlingDelegate <NSObject>

-(void)DatahandlingdidFinshLoadingModel:(NSMutableArray *)model;

@end


@interface Data_handling : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>

@property(nonatomic,assign)id<DatahandlingDelegate>delegate;
@property(nonatomic,retain)NSString * urlstr;//保存连接

-(id)initWithUrlString:(NSString *)string;//初始化方法

-(void)startDownloaderModel;
-(void)cancelDownLoader;


@end
