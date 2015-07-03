//
//  PlayerViewController.m
//  MONO-A
//
//  Created by lanouhn on 15/7/2.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];

    player = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    
    [player.moviePlayer setScalingMode:MPMovieScalingModeAspectFit];
    [player.moviePlayer setControlStyle:MPMovieControlStyleFullscreen];
    [self.view addSubview:player.view];
    [player.view setFrame:[UIScreen mainScreen].bounds];
    [self presentMoviePlayerViewControllerAnimated:player];
    [player.moviePlayer play];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doFinished) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}
-(void)doFinished{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [player.view removeFromSuperview];
    player = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
