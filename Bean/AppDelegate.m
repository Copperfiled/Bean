//
//  AppDelegate.m
//  Bean
//
//  Created by guanxiaobai on 5/5/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "AppDelegate.h"

#import "ActivityListTableViewController.h"
#import "CinemaListTableViewController.h"
#import "MovieListTableViewController.h"    
#import "UserTableViewController.h" 

#import "UINavigationBar+NavBarCustomImage.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    ActivityListTableViewController *activityVC = [[ActivityListTableViewController alloc]initWithStyle:UITableViewStylePlain];
    MovieListTableViewController  *movieVC = [[MovieListTableViewController alloc]initWithStyle:UITableViewStylePlain];
    CinemaListTableViewController *cinemaVC = [[CinemaListTableViewController alloc]initWithStyle:UITableViewStylePlain];
    UserTableViewController *userVC = [[UserTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    UINavigationController *activityNav = [[UINavigationController alloc]initWithRootViewController:activityVC];
    [activityNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
//    [activityNav navigationBar];
    activityNav.tabBarItem.title = @"Activity";
    
    UINavigationController *movieNav = [[UINavigationController alloc]initWithRootViewController:movieVC];
    movieNav.tabBarItem.title = @"Movie";
    
    UINavigationController *userNav = [[UINavigationController alloc]initWithRootViewController:userVC];
    userNav.tabBarItem.title = @"MyPage";
    
    UINavigationController *cinemaNav = [[UINavigationController alloc]initWithRootViewController:cinemaVC];
    cinemaNav.tabBarItem.title = @"Cinema";
    
    UITabBarController *tabBarVC = [[UITabBarController alloc]init];
    tabBarVC.viewControllers = @[activityNav, movieNav, cinemaNav, userNav];
    self.window.rootViewController = tabBarVC;
    
    [activityVC release];
    [movieVC release];
    [cinemaVC release];
    [userVC release];
    [activityNav release];
    [movieNav release];
    [cinemaNav release];
    [userNav release];
    
    [tabBarVC release];    
    [self.window makeKeyAndVisible];
    return YES;
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

@end
