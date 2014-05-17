//
//  AppDelegate.h
//  gvs
//
//  Created by Comus on 15/5/14.
//  Copyright (c) 2014 gv-technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReadPostsViewController;
@class CommodityViewController;
@class CartViewController;
@class FavouriteViewController;
@class SettingsViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) ReadPostsViewController *readPostsViewController;
@property (nonatomic, strong) CommodityViewController *commodityViewController;
@property (nonatomic, strong) CartViewController *cartViewController;
@property (nonatomic, strong) FavouriteViewController *favouriteViewController;
@property (nonatomic, strong) SettingsViewController *settingsViewController;

@end
