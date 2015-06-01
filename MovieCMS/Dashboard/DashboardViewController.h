//
//  DashboardViewController.h
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *ibTableView;


@end
