//
//  AppDelegate.m
//  gvs
//
//  Created by Comus on 15/5/14.
//  Copyright (c) 2014 gv-technology. All rights reserved.
//

#import "AppDelegate.h"
#import "ReadPostsViewController.h"
#import "CommodityViewController.h"
#import "CartViewController.h"
#import "FavouriteViewController.h"
#import "SettingsViewController.h"

static NSString * const TabBarRestorationID = @"TabBarID";
static NSString * const ReadNavigationRestorationID = @"ReadPostsNavigationID";
static NSString * const CommodityNavigationRestorationID = @"CommodityNavigationID";
static NSString * const CartNavigationRestorationID = @"CartNavigationID";
static NSString * const FavouriteNavigationRestorationID = @"FavouriteNavigationID";
static NSString * const SettingsNavigationRestorationID = @"SettingsNavigationID";

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeAppearance];
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    [self.window setFrame:bounds];
    [self.window setBounds:bounds]; // for good measure.
    self.window.backgroundColor = [UIColor blackColor];
    self.window.rootViewController = self.tabBarController;
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
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
    
}

#pragma mark - Custom methods

- (void)customizeAppearance
{
    self.window.tintColor = [StyleGuide newKidOnTheBlockBlue];
    
    [[UINavigationBar appearance] setBarTintColor:[StyleGuide newKidOnTheBlockBlue]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:@"OpenSans-Bold" size:16.0]} ];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"transparent-point"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"transparent-point"]];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [StyleGuide regularTextFont], NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [StyleGuide regularTextFont], NSForegroundColorAttributeName: [UIColor lightGrayColor]} forState:UIControlStateDisabled];
    [[UIToolbar appearance] setBarTintColor:[StyleGuide newKidOnTheBlockBlue]];
    [[UISwitch appearance] setOnTintColor:[StyleGuide newKidOnTheBlockBlue]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"OpenSans" size:10.0]} forState:UIControlStateNormal];
}


#pragma mark - Tab bar methods

- (UITabBarController *)tabBarController {
    if (_tabBarController) {
        return _tabBarController;
    }
    
    UIOffset tabBarTitleOffset = UIOffsetMake(0, 0);
    if ( IS_IPHONE ) {
        tabBarTitleOffset = UIOffsetMake(0, -2);
    }
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.delegate = self;
    _tabBarController.restorationIdentifier = TabBarRestorationID;
    [_tabBarController.tabBar setTranslucent:NO];
    
    
    // Create a background
    // (not strictly needed when white, but left here for possible customization)
    UIColor *backgroundColor = [UIColor whiteColor];
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [backgroundColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage *tabBackgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _tabBarController.tabBar.backgroundImage = tabBackgroundImage;
    
    self.readPostsViewController = [[ReadPostsViewController alloc] init];
    UINavigationController *readNavigationController = [[UINavigationController alloc] initWithRootViewController:self.readPostsViewController];
    readNavigationController.navigationBar.translucent = NO;
    readNavigationController.tabBarItem.image = [UIImage imageNamed:@"icon-tab-read"];
    readNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon-tab-read-filled"];
    readNavigationController.restorationIdentifier = ReadNavigationRestorationID;
    self.readPostsViewController.title = NSLocalizedString(@"Read", nil);
    [readNavigationController.tabBarItem setTitlePositionAdjustment:tabBarTitleOffset];
    
    self.commodityViewController = [[CommodityViewController alloc] init];
    UINavigationController *commodityNavigationController = [[UINavigationController alloc] initWithRootViewController:self.commodityViewController];
    commodityNavigationController.navigationBar.translucent = NO;
    commodityNavigationController.tabBarItem.image = [UIImage imageNamed:@"icon-tab-commodity"];
    commodityNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon-tab-commodity-filled"];
    commodityNavigationController.restorationIdentifier = CommodityNavigationRestorationID;
    self.commodityViewController.title = NSLocalizedString(@"Commodity", nil);
    [commodityNavigationController.tabBarItem setTitlePositionAdjustment:tabBarTitleOffset];
    
    self.cartViewController = [[CartViewController alloc] init];
    UINavigationController *cartNavigationController = [[UINavigationController alloc] initWithRootViewController:self.cartViewController];
    cartNavigationController.navigationBar.translucent = NO;
    cartNavigationController.tabBarItem.image = [UIImage imageNamed:@"icon-tab-cart"];
    cartNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon-tab-cart-filled"];
    cartNavigationController.restorationIdentifier = CartNavigationRestorationID;
    self.cartViewController.title = NSLocalizedString(@"Cart", nil);
    [cartNavigationController.tabBarItem setTitlePositionAdjustment:tabBarTitleOffset];
    
    self.favouriteViewController = [[FavouriteViewController alloc] init];
    UINavigationController *favouriteNavigationController = [[UINavigationController alloc] initWithRootViewController:self.favouriteViewController];
    favouriteNavigationController.navigationBar.translucent = NO;
    favouriteNavigationController.tabBarItem.image = [UIImage imageNamed:@"icon-tab-favourite"];
    favouriteNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon-tab-favourite-filled"];
    favouriteNavigationController.restorationIdentifier = FavouriteNavigationRestorationID;
    self.favouriteViewController.title = NSLocalizedString(@"Favourite", nil);
    [favouriteNavigationController.tabBarItem setTitlePositionAdjustment:tabBarTitleOffset];
    
    self.settingsViewController = [[SettingsViewController alloc] init];
    UINavigationController *settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:self.settingsViewController];
    settingsNavigationController.navigationBar.translucent = NO;
    settingsNavigationController.tabBarItem.image = [UIImage imageNamed:@"icon-tab-settings"];
    settingsNavigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon-tab-settings-filled"];
    settingsNavigationController.restorationIdentifier = SettingsNavigationRestorationID;
    self.settingsViewController.title = NSLocalizedString(@"Settings", nil);
    [settingsNavigationController.tabBarItem setTitlePositionAdjustment:tabBarTitleOffset];
    
    _tabBarController.viewControllers = @[readNavigationController, commodityNavigationController, cartNavigationController, favouriteNavigationController, settingsNavigationController];
    
    [_tabBarController setSelectedViewController:readNavigationController];
    
    return _tabBarController;
}

@end
