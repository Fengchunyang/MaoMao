//
//  Function.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Function.h"

#define kCornerRadio 8
#define kBorderWidth 1
#define kLayerColor [[UIColor orangeColor] CGColor]


@implementation Function

// 创建view
+ (UIView *)createViewWithFrame:(CGRect)frame
{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    return view;
}

// 创建label
+ (UILabel *)createLabelWithFrame:(CGRect)frame name:(NSString *)name
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = name;
//    label.layer.cornerRadius = kCornerRadio;
//    label.layer.borderWidth = kBorderWidth;
//    label.layer.borderColor = kLayerColor;
    label.textAlignment = 1;
    label.font = [UIFont systemFontOfSize:19];
    return [label autorelease];
}

// 创建imageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    UIImage *image = [UIImage imageNamed:@"111.jpg"];;
    imageView.image = image;
    imageView.userInteractionEnabled = YES;
    return [imageView autorelease];
}

// 创建输入框
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame plachodel:(NSString *)string
{
    UITextField *text = [[UITextField alloc] initWithFrame:frame];
    text.placeholder = string;
    text.layer.cornerRadius = kCornerRadio;
    text.layer.borderColor = kLayerColor;
    text.layer.borderWidth = kBorderWidth;
    return [text autorelease];
}

// 创建textView
+ (UITextView *)createTextViewWithFrame:(CGRect)frame
{
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.layer.cornerRadius = kCornerRadio;
    textView.layer.borderWidth = kBorderWidth;
    textView.layer.borderColor = kLayerColor;
    return [textView autorelease];
}

// 创建button
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}


@end
