//
//  NetWorkEngine.m
//  23WaterFlowTest
//
//  Created by liuxiangyu on 15/6/14.
//  Copyright (c) 2015年 lanou3G.com. All rights reserved.
//

#import "NetWorkEngine.h"
#import <UIKit/UIKit.h>

// 延展
@interface NetWorkEngine ()

@property (nonatomic , assign) id<NetWorkEngineDelegate> delegate;  // 代理对象
@property (nonatomic , retain) NSURL *url;  // 请求地址
@property (nonatomic , retain) NSDictionary *params1;    // 请求的参数字典
@property (nonatomic , retain) NSString *HTTPMethod;    // 请求方式
@property (nonatomic , retain) NSString *stringFromParams;    // 参数拼接成的字符串


@end


@implementation NetWorkEngine


+ (id)engineWithURL:(NSURL *)url parameters:(NSDictionary *)params deleagte:(id<NetWorkEngineDelegate>)delegate
{
    NetWorkEngine *engine = [[NetWorkEngine alloc] init];
    engine.url = url;
    engine.delegate = delegate;
    engine.params1 = params;
    engine.HTTPMethod = @"GET";
    return [engine autorelease];
}

- (void)setHTTPType:(NSString *)method
{
    if (!method) {
        // 没有传过来请求方法，默认使用GET方法
        return;
    }
    self.HTTPMethod = method; // 保存请求方式
    
}

#pragma mark - 将参数列表拼接成参数字符串
- (NSString *)returnStringFormParams:(NSDictionary *)params
{
    NSMutableArray *temps = [NSMutableArray array];
    for (NSString *key in params) {
        NSString *param = [NSString stringWithFormat:@"%@=%@" , key , params[key]];
        [temps addObject:param];
    }
    // 用指定的字符串两两数组中的字符
    return [temps componentsJoinedByString:@"&"];
}

#pragma mark - 设定参数列表
- (void)setParams1:(NSDictionary *)params
{
    if (!params) {
        return;
    }
    // 如果参数字典存在，直接调用私有方法将其转换成参数列表字符串
    self.stringFromParams = [self returnStringFormParams:params];
}
 



#pragma mark - start 开始启动网络请求
- (void)start
{
    if ([self.HTTPMethod isEqualToString:@"GET"] && self.stringFromParams) {
        NSString *getURLString = [self.url.absoluteString stringByAppendingFormat:@"?%@" , _stringFromParams];
        self.url = [NSURL URLWithString:getURLString];
    }
    
    // 创建可变的请求对象
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:self.url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    
    // 设置请求方式
    mutableRequest.HTTPMethod = self.HTTPMethod;
    
    if ([self.HTTPMethod isEqualToString:@"POST"]) {
        // 使用post请求方式时，需要给可变的请求体属性赋参数字符串
        mutableRequest.HTTPBody = [self.stringFromParams dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    // 使用异步连接方式
    [NSURLConnection sendAsynchronousRequest:mutableRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (_delegate && [_delegate respondsToSelector:@selector(netWorkDidFinishLoading:withInfo:)]) {
            [self.delegate netWorkDidFinishLoading:self withInfo:data];
        }
    }];
}


- (void)dealloc
{
    _delegate = nil;
    [_url release];
    [_params1 release];
    [_HTTPMethod release];
    [_stringFromParams release];
    [super dealloc];
}

@end
