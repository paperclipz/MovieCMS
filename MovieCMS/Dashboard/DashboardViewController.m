//
//  DashboardViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "DashboardViewController.h"
#import "DashboardTableViewCell.h"
@interface DashboardViewController ()

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initSelfView];
}

-(void)initSelfView
{
    self.ibTableView.delegate = self;
    self.ibTableView.dataSource = self;
    [self.ibTableView registerClass:[DashboardTableViewCell class] forCellReuseIdentifier:@"DashboardTableViewCell"];
    [self styleNavBar];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)styleNavBar {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    UINavigationBar *newNavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64.0)];
//    [newNavBar setTintColor:[UIColor whiteColor]];
//    UINavigationItem *newItem = [[UINavigationItem alloc] init];
//    newItem.title = @"Paths";
//    
//    // BackButtonBlack is an image we created and added to the app’s asset catalog
//    UIImage *backButtonImage = [UIImage imageNamed:@"BackButtonBlack"];
//    
//    // any buttons in a navigation bar are UIBarButtonItems, not just regular UIButtons. backTapped: is the method we’ll call when this button is tapped
//    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(backTapped:)];
//    
//    // the bar button item is actually set on the navigation item, not the navigation bar itself.
//    newItem.leftBarButtonItem = backBarButtonItem;
//    
//    [newNavBar setItems:@[newItem]];
//    [self.view addSubview:newNavBar];
}
#pragma mark - UITableView Delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DashboardTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"DashboardTableViewCell"];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
