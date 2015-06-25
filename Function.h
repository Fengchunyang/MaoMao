//
//  Function.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Function : NSObject

// 创建view
+ (UIView *)createViewWithFrame:(CGRect)frame;

// 创建label
+ (UILabel *)createLabelWithFrame:(CGRect)frame name:(NSString *)name;

// 创建imageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame;

// 创建输入框
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame plachodel:(NSString *)string;

// 创建textView
+ (UITextView *)createTextViewWithFrame:(CGRect)frame;

// 创建button
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title;


@end
