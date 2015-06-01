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
    
    [self.view addSubview:self.menuViewController.view];
}
-(MenuViewController*)menuViewController{
    if(!_menuViewController)
    {
        _menuViewController = [MenuViewController new];
    }
    return _menuViewController;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
