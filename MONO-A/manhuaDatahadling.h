//
//  manhuaDatahadling.h
//  mono
//
//  Created by 张浩杰 on 15-7-2.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol manhuadatahadlingDelegate <NSObject>

-(void)manhuaDatahandlingdidFinshLoadingModel:(NSMutableArray *)model;
-(void)dingduantupian:(NSString *)str;

@end

@interface manhuaDatahadling : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>

@property(nonatomic,assign)id<manhuadatahadlingDelegate>delegate;
@property(nonatomic,retain)NSString * urlstr;//保存连接

-(id)initWithUrlString:(NSString *)string;//初始化方法

-(void)startDownloaderModel;
-(void)cancelDownLoader;


@end
