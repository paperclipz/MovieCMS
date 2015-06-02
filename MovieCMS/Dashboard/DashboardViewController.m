//
//  DashboardViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "DashboardViewController.h"
#import "DashboardTableViewCell.h"
#import "MenuSelectionCVCell.h"
#import "MovieClass.h"
#import "DashboardWinnerTableViewCell.h"
@interface DashboardViewController ()
@property (strong, nonatomic) IBOutlet UIButton *btnContest;
@property (strong, nonatomic) IBOutlet UIButton *btnWinner;
@property (assign,nonatomic) int collectionViewIndex;
@property (strong,nonatomic) NSMutableArray* arrTableList;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initSelfView];
}

-(void)initSelfView
{
    self.collectionViewIndex = 0;
    [self initTableViewWithDelegate:self];
    [self initCollectionViewWithDelegate:self];
    [self styleNavBar];
    
}
-(void)initTableViewWithDelegate:(id)delegate
{
    self.ibTableView.delegate = delegate;
    self.ibTableView.dataSource = delegate;
    
    [self reloadTableView];

}
-(void)initCollectionViewWithDelegate:(id)delegate
{
    self.ibCVSelection.delegate = delegate;
    self.ibCVSelection.dataSource = delegate;
    self.ibCVSelection.backgroundColor = [UIColor clearColor];
    [self.ibCVSelection registerClass:[MenuSelectionCVCell class] forCellWithReuseIdentifier:@"MenuSelectionCVCell"];
    
    
}

-(void)reloadTableView
{
    switch (self.collectionViewIndex) {
        default:
        case 0:
            self.ibTableView.hidden = false;
            self.ibTblWinner.hidden = true;
            
            [self.ibTableView registerClass:[DashboardTableViewCell class] forCellReuseIdentifier:@"DashboardTableViewCell"];
            break;
        case 1:
            self.ibTableView.hidden = true;
            self.ibTblWinner.hidden = false;
            
            [self.ibTblWinner registerClass:[DashboardWinnerTableViewCell class] forCellReuseIdentifier:@"DashboardWinnerTableViewCell"];
            break;
    }

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
    NSLog(@"aaaaa =  %f",self.arrTableList.count);
    return self.arrTableList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.collectionViewIndex == 0) {
        DashboardTableViewCell* cell = [self.ibTableView dequeueReusableCellWithIdentifier:@"DashboardTableViewCell"];
        [cell initData:self.arrTableList[indexPath.row]];
        return cell;

    }
    else
    {
        DashboardWinnerTableViewCell* cell = [self.ibTblWinner dequeueReusableCellWithIdentifier:@"DashboardWinnerTableViewCell"];
        return cell;

    }
   
}

#pragma mark - UICollectionview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.collectionViewIndex == 0) {
        return 88.0f;

    }
    else{
        return 53.0f;

    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuSelectionCVCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MenuSelectionCVCell" forIndexPath:indexPath];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    cell.frame = CGRectMake(indexPath.row==0?cell.frame.origin.x:screenWidth/2, cell.frame.origin.y, screenWidth/2,cell.frame.size.height);
    [cell setIndex:(int)indexPath.row Selected:(int)indexPath.row==self.collectionViewIndex?YES:NO];

      return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.collectionViewIndex!= (int)indexPath.row) {
        [self.ibTableView reloadData];
    }
    self.collectionViewIndex = (int)indexPath.row;
    
    [collectionView reloadData];
    
    [self reloadTableView];
}

#pragma mark - Declaration

-(NSMutableArray*)arrTableList
{
    if (!_arrTableList) {
        _arrTableList = [NSMutableArray new];
        MovieClass* tempClass = [MovieClass new];
        tempClass.image = [UIImage imageNamed:@"sample001.png"];
        [_arrTableList addObject:tempClass];
        tempClass = nil;
        
        tempClass = [MovieClass new];
        tempClass.image = [UIImage imageNamed:@"sample002.png"];
        [_arrTableList addObject:tempClass];
        tempClass = nil;
        
        tempClass = [MovieClass new];
        tempClass.image = [UIImage imageNamed:@"sample001.png"];
        [_arrTableList addObject:tempClass];
        tempClass = nil;
        
        tempClass = [MovieClass new];
        tempClass.image = [UIImage imageNamed:@"sample002.png"];
        [_arrTableList addObject:tempClass];
        tempClass = nil;
        
        tempClass = [MovieClass new];
        tempClass.image = [UIImage imageNamed:@"sample002.png"];
        [_arrTableList addObject:tempClass];
        tempClass = nil;

    }
    return _arrTableList;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{


    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI_2)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;


    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;

    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);

    //!!!FIX for issue #1 Cell position wrong------------
    if(cell.layer.position.x != 0){
        cell.layer.position = CGPointMake(0, cell.layer.position.y);
    }

    //4. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
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
