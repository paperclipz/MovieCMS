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
#import "QRScannerViewController.h"
#import "MasterViewController.h"
//#import "MovieCMS-Swift.h"
#import "LoginViewController.h"
#import "SettingViewController.h"
#import "WinnerDisplayViewController.h"

@interface ViewController : UIViewController<QRCodeReaderDelegate>

@property (strong, nonatomic) MFSideMenuContainerViewController *mfSideMenuContainerViewController;


@property (strong, nonatomic) MenuViewController *menuViewController;

@property (strong, nonatomic) ProfileViewController *profileViewController;

@property (strong, nonatomic) UINavigationController *navDashboardViewController;

@property (strong, nonatomic) DashboardViewController *dashboardViewController;

@property (strong, nonatomic) QRScannerViewController *qrScannerViewController;

@property (strong, nonatomic) LoginViewController *loginViewController;

@property (strong, nonatomic) SettingViewController *settingViewController;


@property (strong, nonatomic) WinnerDisplayViewController *winnerDisplayViewController;


@end

