//
//  AppDelegate.m
//  SampleApp
//
//  Created by plusend on 2019/5/12.
//  Copyright © 2019 plusend. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "VideoViewController.h"
#import "RecommendViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    UITabBarController *tabbarController = [[UITabBarController alloc] init];

    ViewController *viewController = [[ViewController alloc]init];

//    UIViewController *controller1 = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor redColor];
    viewController.tabBarItem.title = @"News";
    viewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page"];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected"];

    VideoViewController *videoController = [[VideoViewController alloc] init];

    RecommendViewController *recommendViewController = [[RecommendViewController alloc] init];

    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor lightGrayColor];
    controller4.tabBarItem.title = @"Me";
    controller4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home"];
    controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected"];

    [tabbarController setViewControllers:@[viewController, videoController, recommendViewController, controller4]];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];

    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
