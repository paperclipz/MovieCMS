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

@interface ViewController : UIViewController

@property (strong, nonatomic) MFSideMenuContainerViewController *mfSideMenuContainerViewController;
@property (strong, nonatomic) MenuViewController *menuViewController;


@end

