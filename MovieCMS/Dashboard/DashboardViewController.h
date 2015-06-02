//
//  DashboardViewController.h
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DashboardViewController : MasterViewController <UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *ibTableView;
@property (strong, nonatomic) IBOutlet UICollectionView *ibCVSelection;

@property (strong, nonatomic) IBOutlet UITableView *ibTblWinner;

@end
