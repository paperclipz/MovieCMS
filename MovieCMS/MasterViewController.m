//
//  MasterViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/2/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "MasterViewController.h"
#import "MFSideMenuContainerViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)toggleMenuOpen
{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //[[LanguageManager sharedManager] AddLanguage:self];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation MasterViewController(Additions)

-(MasterViewController*)addAnimation:(NSString*)transitionType
{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = transitionType;
    [[self navigationController].view.layer addAnimation:transition forKey:kCATransition];

    return self;
}
#pragma MARK - UITEXTFIELD
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];
    
    return YES;
}
@end
