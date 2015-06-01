//
//  ViewController.h
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu/MFSideMenu.h"
#import "MenuViewController.h"
#import "ProfileViewController.h"
#import "DashboardViewController.h"
@interface ViewController : UIViewController

@property (strong, nonatomic) MFSideMenuContainerViewController *mfSideMenuContainerViewController;

@property (strong, nonatomic) UINavigationController *navMenuViewController;

@property (strong, nonatomic) MenuViewController *menuViewController;

@property (strong, nonatomic) UINavigationController *navProfileViewController;

@property (strong, nonatomic) ProfileViewController *profileViewController;

@property (strong, nonatomic) UINavigationController *navDashboardViewController;

@property (strong, nonatomic) DashboardViewController *dashboardViewController;


@end

