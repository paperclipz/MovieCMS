//
//  ViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initSelfView];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    NSLog(@"ViewController");
    [self initSelfView];
}

-(void)initSelfView
{
    
    //[self.navigationController presentViewController:self.navigationViewController animated:YES completion:NULL];
    self.mfSideMenuContainerViewController = [MFSideMenuContainerViewController new];
    [self.mfSideMenuContainerViewController setLeftMenuViewController:self.menuViewController];
    
    [self.view addSubview:self.mfSideMenuContainerViewController.view];
    [self.mfSideMenuContainerViewController setCenterViewController:self.navDashboardViewController];

}

-(UINavigationController*)navMenuViewController
{
    if(!_navMenuViewController)
    {
        _navMenuViewController = [[UINavigationController alloc]initWithRootViewController:self.menuViewController];
    }
    
    return _navMenuViewController;
}

-(UINavigationController*)navProfileViewController
{
    if(!_navProfileViewController)
    {
        _navProfileViewController = [[UINavigationController alloc]initWithRootViewController:self.profileViewController];
    }
    
    return _navProfileViewController;
}

-(MenuViewController*)menuViewController{
    if(!_menuViewController)
    {
        _menuViewController = [MenuViewController new];
    }
    return _menuViewController;
}

-(ProfileViewController*)profileViewController{
    if(!_profileViewController)
    {
        _profileViewController = [ProfileViewController new];
    }
    return _profileViewController;
}


-(UINavigationController*)navDashboardViewController
{
    if(!_navDashboardViewController)
    {
        _navDashboardViewController = [[UINavigationController alloc]initWithRootViewController:self.dashboardViewController];
    }
    
    return _navDashboardViewController;
}

-(MenuViewController*)dashboardViewController{
    if(!_dashboardViewController)
    {
        _dashboardViewController = [DashboardViewController new];
    }
    return _dashboardViewController;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
