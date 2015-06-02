//
//  ViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "ViewController.h"
#import "CustomNavBar.h"

@interface ViewController ()

@end

@implementation UINavigationBar (UINavigationBarCategory)

- (void)drawRect:(CGRect)rect
{
 
    UIView *imageView = [[UIView alloc] init];
    imageView.backgroundColor = [UIColor colorWithRed:(48/255.0) green:(48/255.0) blue:(48/255.0) alpha:1];
}
-(void)ggaaa
{

}
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

-(void)menuClosed
{
    [self.mfSideMenuContainerViewController setMenuState:MFSideMenuStateClosed];
    
}

-(void)initSelfView
{
    
    //[self.navigationController presentViewController:self.navigationViewController animated:YES completion:NULL];
    self.mfSideMenuContainerViewController = [MFSideMenuContainerViewController new];
    [self.mfSideMenuContainerViewController setLeftMenuViewController:self.menuViewController];
    
    [self.view addSubview:self.mfSideMenuContainerViewController.view];
    [self.mfSideMenuContainerViewController setCenterViewController:self.navProfileViewController];

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
        __weak typeof(self)weakSelf = self;

        _menuViewController.didSelectMenuAtIndexBlock = ^(int index){
        
            [weakSelf didSelectMenuAtIndex:index];
            [weakSelf menuClosed];
        };
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

-(DashboardViewController*)dashboardViewController{
    if(!_dashboardViewController)
    {
        _dashboardViewController = [DashboardViewController new];
    }
    return _dashboardViewController;
}

-(UINavigationController*)navQRScannerViewController
{
    if(!_navQRScannerViewController)
    {
        _navQRScannerViewController = [[UINavigationController alloc]initWithRootViewController:self.qrScannerViewController];
    }
    return _navDashboardViewController;
}

-(QRScannerViewController*)qrScannerViewController{
    if(!_qrScannerViewController)
    {
        _qrScannerViewController = [QRScannerViewController new];
    }
    return _qrScannerViewController;
}


-(void)didSelectMenuAtIndex:(int)index
{
    [self.mfSideMenuContainerViewController setCenterViewController:self.navProfileViewController];

    switch (index) {
        case 0:
            [self.mfSideMenuContainerViewController setCenterViewController:self.navProfileViewController];

            break;
        case 1:
            [self.mfSideMenuContainerViewController setCenterViewController:self.qrScannerViewController];

            break;
        case 2:
            [self.mfSideMenuContainerViewController setCenterViewController:self.navDashboardViewController];

            break;
            
        default:
            break;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
