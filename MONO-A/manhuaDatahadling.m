//
//  manhuaDatahadling.m
//  mono
//
//  Created by 张浩杰 on 15-7-2.
//  Copyright (c) 2015年 张浩杰. All rights reserved.
//

#import "manhuaDatahadling.h"
#import "manhuaModel.h"
@interface manhuaDatahadling ()
@property(nonatomic,retain)NSMutableData * recevieData;
@property(nonatomic,retain)NSURLConnection * connection;



@end

@implementation manhuaDatahadling

-(id)initWithUrlString:(NSString *)string
{
    self= [super init];
    if (self) {
        self.urlstr = string;
        [self startDownloaderModel];
    }
    
    return self;
}

//开始下载,在初始化方法里调用
-(void)startDownloaderModel
{
    if (self.urlstr.length ==0) {
        return;
    }
    NSURL * url = [NSURL URLWithString:self.urlstr];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    self.connection = [NSURLConnection connectionWithRequest:request  delegate:self];
    
}
-(void)cancelDownLoader
{
    [self.connection cancel];
    self.connection = nil;
    
}

//下载代理方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{   //初始化data;
    self.recevieData = [NSMutableData data];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.recevieData appendData:data];
}

//接受完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary * bigdic = [NSJSONSerialization JSONObjectWithData:self.recevieData options:NSJSONReadingMutableContainers error:nil];
    
    NSDictionary *  smalldic = [bigdic objectForKey:@"data"];
    NSString * str = [smalldic objectForKey:@"cover_image_url"];
    NSArray * smallArray = [smalldic objectForKey:@"comics"];
    NSMutableArray * Modelarray = [NSMutableArray  array];//存放处理好的model;
    for (NSDictionary * dic in smallArray) {
        // NSLog(@"%@",dic);
       manhuaModel * model = [[manhuaModel alloc] initWithDictionary:dic];
        [Modelarray addObject:model];
        [model release];
      
    }
    if (_delegate && [_delegate respondsToSelector:@selector(manhuaDatahandlingdidFinshLoadingModel:)]) {
        [_delegate manhuaDatahandlingdidFinshLoadingModel:Modelarray];
        [_delegate dingduantupian:str];
    }
    
    
}
- (void)dealloc
{    _delegate = nil;
    _urlstr = nil;
    _recevieData = nil;
    _connection = nil;
    [super dealloc];
}





@end
