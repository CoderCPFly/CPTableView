//
//  AppDelegate.m
//  CPTableViewExample
//
//  Created by 陈鹏 on 2018/6/1.
//  Copyright © 2018年 陈鹏. All rights reserved.
//

#import "AppDelegate.h"
#import "CPMeViewController.h"
#import "CPConst.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UITabBarController *tabBarVc = [[UITabBarController alloc] init];
    NSArray *titleArr = @[@"微信", @"通讯录", @"发现", @"我"];
    NSArray *imageArr = @[@"tabbar_mainframe", @"tabbar_contacts", @"tabbar_discover", @"tabbar_me"];
    for (int i = 0 ; i < titleArr.count; i++) {
        NSString *title = titleArr[i];
        NSString *imageName = imageArr[i];
        NSString *selectedImageName = [NSString stringWithFormat:@"%@HL", imageName];
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        if ([title isEqualToString:@"我"]) {
            vc = [[CPMeViewController alloc] init];
        }
        vc.title = title;
        vc.tabBarItem.image = [UIImage imageNamed:imageName];
        NSMutableDictionary *barBtnAttrs = [NSMutableDictionary dictionary];
        barBtnAttrs[NSForegroundColorAttributeName] = CPColorWithRGB(30, 161, 20, 1);
        [vc.tabBarItem setTitleTextAttributes:barBtnAttrs forState:UIControlStateSelected];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        NSMutableDictionary *navBarAttrs = [NSMutableDictionary dictionary];
        navBarAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [nav.navigationBar setTitleTextAttributes:navBarAttrs];
        nav.navigationBar.barTintColor = [UIColor blackColor];
        nav.navigationBar.barStyle = UIBarStyleBlack;
        nav.navigationBar.tintColor = [UIColor whiteColor];
        [tabBarVc addChildViewController:nav];
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarVc;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
