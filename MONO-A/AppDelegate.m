//
//  AppDelegate.m
//  MONO-A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

#import "ProgrammeViewController.h"
#import "MONOViewController.h"
#import "PictorialViewController.h"
#import "CreatorViewController.h"
#import "MagazineViewController.h"
#import "PastViewController.h"
#import "TeaViewController.h"

#import "UMSocial.h"

#define kItemWidth 100
#import "PlayerViewController.h"
@interface AppDelegate ()
@property (nonatomic , retain)PlayerViewController *playerVC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [UMSocialData setAppKey:@"55962bb367e58e94c2000af8"];
    
    [self next];
    
    return YES;
}

- (void)next
{
    
    ProgrammeViewController *proVC = [[ProgrammeViewController alloc]init];
    MONOViewController *monoVC = [[MONOViewController alloc]init];
    
    PictorialViewController *picVC = [[PictorialViewController alloc]init];
    
    CreatorViewController *creVC = [[CreatorViewController alloc]init];
    
    MagazineViewController *magVC = [[MagazineViewController alloc]init];
    
    PastViewController *pastVC = [[PastViewController alloc]init];
    
    UIView *line1 = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 3)];
    line1.backgroundColor = [UIColor cyanColor];
    line1.hidden = YES;
   
    UIView *pro = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 44)];
    UILabel *label1 = [Function createLabelWithFrame:CGRectMake(0, 10, kItemWidth, 44 - 10) name:@"节目单"];
    label1.textColor = [UIColor whiteColor];
    //label1.backgroundColor = [UIColor yellowColor];
    [pro addSubview:line1];
    [pro addSubview:label1];

    [line1 release];
    [label1 release];
    UIView *mono = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 44)];
    UIView *line2 = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 3)];
    //line2.hidden = YES;
    line2.backgroundColor = [UIColor cyanColor];
    UILabel *label2 = [Function createLabelWithFrame:label1.frame name:@"MONO推荐"];
    label2.textColor = [UIColor whiteColor];
    //label2.backgroundColor = [UIColor yellowColor];
    [mono addSubview:line2];
    [mono addSubview:label2];
    

    [line2 release];
    [label2 release];
    
    UIView *pic = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 44)];
    UIView *line3 = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 3)];
    line3.hidden = YES;
    line3.backgroundColor = [UIColor cyanColor];
    UILabel *label3 = [Function createLabelWithFrame:label1.frame name:@"画报"];
    label3.textColor = [UIColor whiteColor];
    //label3.backgroundColor = [UIColor yellowColor];
    [pic addSubview:line3];
    [pic addSubview:label3];
    

    [line3 release];
    [label3 release];
    
    UIView *cre = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 44)];
    UIView *line4 = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 3)];
    line4.hidden = YES;
    line4.backgroundColor = [UIColor cyanColor];
    UILabel *label4 = [Function createLabelWithFrame:label1.frame name:@"造物主"];
    label4.textColor = [UIColor whiteColor];
    //label4.backgroundColor = [UIColor yellowColor];
    [cre addSubview:line4];
    [cre addSubview:label4];
    

    [line4 release];
    [label4 release];
    
    UIView *mag = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 44)];
    UIView *line5 = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 3)];
    line5.hidden = YES;
    line5.backgroundColor = [UIColor cyanColor];
    UILabel *label5 = [Function createLabelWithFrame:label1.frame name:@"MONO杂粮"];
    label5.textColor = [UIColor whiteColor];
    //label5.backgroundColor = [UIColor yellowColor];
    [mag addSubview:line5];
    [mag addSubview:label5];
    
    [line5 release];
    [label5 release];
    
    UIView *past = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 44)];
    UIView *line6 = [Function createViewWithFrame:CGRectMake(0, 0, kItemWidth, 3)];
    line6.hidden = YES;
    line6.backgroundColor = [UIColor cyanColor];
    UILabel *label6 = [Function createLabelWithFrame:label1.frame  name:@"漫画"];
    label6.textColor = [UIColor whiteColor];
    //label6.backgroundColor = [UIColor yellowColor];
    [past addSubview:line6];
    [past addSubview:label6];
    
    [line6 release];
    [label6 release];
    
    
    RootViewController *rootVC = [[RootViewController alloc]initWithNavBarItems:@[pro , mono , pic , cre , mag , past] navBarBackground:[UIColor clearColor] controllers:@[proVC , monoVC , picVC , creVC , magVC , pastVC] showPageControl:NO];;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg-tab"] forBarMetrics:UIBarMetricsDefault];
    
    self.window.rootViewController = nav;
    
    [rootVC setCurrentIndex:1 animated:YES];
    
    [rootVC release];
    [pro release];
    [mono release];
    [cre release];
    [mag release];
    [past release];
    [pic release];
    
    
    
    [proVC release];
    [monoVC release];
    [picVC release];
    [creVC release];
    [magVC release];
    [pastVC release];
    
    
    

}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)dealloc
{
    

    
    [super dealloc];
}

@end
