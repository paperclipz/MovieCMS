//
//  MenuView.h
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuView : UIView
+ (id)initializeCustomView;
@property (strong, nonatomic) IBOutlet UITableView *ibTableView;
-(void)initTableViewDelegate :(id)delegate;

@end
