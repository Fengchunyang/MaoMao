//
//  AppDelegate.h
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MPMoviePlayerViewController *player;
}
@property (strong, nonatomic) UIWindow *window;

@property (nonatomic , retain) UIButton *myButton;
@property (nonatomic , assign) NSInteger k;

@end

