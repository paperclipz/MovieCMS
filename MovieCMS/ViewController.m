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

    //TODO: Change the center view controller to set default loading screen
    [self.mfSideMenuContainerViewController setCenterViewController:self.navDashboardViewController];

}


//-(UINavigationController*)navProfileViewController
//{
//    if(!_navProfileViewController)
//    {
//        _navProfileViewController = [[UINavigationController alloc]initWithRootViewController:self.profileViewController];
//    }
//    
//    return _navProfileViewController;
//}

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
        CATransition* transition = [CATransition animation];
        
        transition.duration = 0.3;
        transition.type = kCATransitionFade;
        
        [_navDashboardViewController.view.layer addAnimation:transition forKey:kCATransition];

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

//-(UINavigationController*)navQRScannerViewController
//{
//    if(!_navQRScannerViewController)
//    {
//        _navQRScannerViewController = [[UINavigationController alloc]initWithRootViewController:self.qrScannerViewController];
//    }
//    return _navDashboardViewController;
//}

-(QRScannerViewController*)qrScannerViewController{
    if(!_qrScannerViewController)
    {
        _qrScannerViewController = [QRScannerViewController new];
    }
    return _qrScannerViewController;
}

#pragma mark -- LOGIN
//-(UINavigationController*)navLoginViewController
//{
//    if(!_navLoginViewController)
//    {
//        _navLoginViewController = [[UINavigationController alloc]initWithRootViewController:self.loginViewController];
//    }
//    return _navLoginViewController;
//}

-(LoginViewController*)loginViewController{
    if(!_loginViewController)
    {
        _loginViewController = [LoginViewController new];
        __weak typeof (self)weakSelf = self;
        _loginViewController.performLoginBlock =^{
            Utils.isLogin = YES;
            [weakSelf didSelectMenuAtIndex:0];
            [weakSelf.menuViewController menuListDidChangeFromLogin];
            
        };
    }
    return _loginViewController;
}

-(SettingViewController*)settingViewController{
    if(!_settingViewController)
    {
        _settingViewController = [SettingViewController new];

    }
    return _settingViewController;
}
-(WinnerDisplayViewController*)winnerDisplayViewController{
    if(!_winnerDisplayViewController)
    {
        _winnerDisplayViewController = [WinnerDisplayViewController new];
        
    }
    return _winnerDisplayViewController;
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    NSLog(@"readerDidCancel");
    [self.dashboardViewController.navigationController popViewControllerAnimated:NO];
}

-(void)didSelectMenuAtIndex:(int)index
{
    NSLog(@"didSelectMenuAtIndex = %d",index);
    [self.dashboardViewController.navigationController popToRootViewControllerAnimated:false];
    switch (index) {
        case 0://profile

            if (Utils.isLogin) {
                 [self.dashboardViewController.navigationController pushViewController:self.profileViewController animated:false];
            }
            else{
               [self.dashboardViewController.navigationController pushViewController:self.loginViewController animated:false];
            }
            break;
            
        case 1://qr scanner
            
            [self.dashboardViewController.navigationController pushViewController:self.winnerDisplayViewController animated:NO];
            [self.winnerDisplayViewController LoadScanner];

            break;
        case 2:
            [self.dashboardViewController.navigationController pushViewController:self.settingViewController animated:false];
            
            //[self.dashboardViewController.navigationController pushViewController:self.dashboardViewController animated:false];

          //  [self.mfSideMenuContainerViewController setCenterViewController:self.navDashboardViewController];

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
