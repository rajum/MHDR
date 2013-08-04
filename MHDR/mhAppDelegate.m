//
//  mhAppDelegate.m
//  MHDR
//
//  Created by Raju Maharjan on 7/12/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "mhAppDelegate.h"
#import "TeamListViewController.h"
#import "LoginViewController.h"
#import "LoginStoryboardViewController.h"
#import "TestViewController.h"


@implementation mhAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //MainViewController *mainlvc = [[MainViewController alloc] initWithStyle:UITableViewStylePlain];
    
    //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:teamlvc];
    
    //self.window.rootViewController = navController;
    //LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];

    
    //self.viewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginVC];
    //self.window.rootViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    //self.window.rootViewController = navController;
    //self.window.rootViewController = loginVC;

    
    //self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    
    
    //TeamMember *teamMember = [[self.teamMemberList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    //detailStoryboardViewController.member = teamMember;
    //[self.navigationController pushViewController:detailStoryboardViewController animated:YES];
  
    
    //TestViewController *testVc = [[TestViewController alloc] init];
    //self.window.rootViewController = testVc;
    
    UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:nil];
    //LoginStoryboardViewController *loginStoryboardVC = [[loginStoryboard instantiateInitialViewController] initWithStyle:UITableViewStyleGrouped];
    LoginStoryboardViewController *loginStoryboardVC = [loginStoryboard instantiateInitialViewController];
    self.window.rootViewController = loginStoryboardVC;

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
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
