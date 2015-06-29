//
//  NetWorkEngine.h
//  23WaterFlowTest
//
//  Created by liuxiangyu on 15/6/14.
//  Copyright (c) 2015年 lanou3G.com. All rights reserved.
//

#import <Foundation/Foundation.h>


// 代理协议
@class NetWorkEngine;
@protocol NetWorkEngineDelegate <NSObject>

@optional
- (void)netWorkDidStartLoading:(NetWorkEngine *)engine; // 开始加载网络
- (void)netWorkDidFinishLoading:(NetWorkEngine *)engine withInfo:(id)info;  // 网络加载结束

@end


@interface NetWorkEngine : NSObject

+ (id)engineWithURL:(NSURL *)url parameters:(NSDictionary *)params deleagte:(id<NetWorkEngineDelegate>)delegate;
// 设置请求方式
- (void)setHTTPType:(NSString *)method;
// 开始请求
- (void)start;

@end
