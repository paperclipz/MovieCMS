//
//  MasterViewController.h
//  MovieCMS
//
//  Created by Paperclipz on 6/2/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MFSideMenuAdditions.h"




@interface MasterViewController : UIViewController
-(void)toggleMenuOpen;

@end

@interface MasterViewController(Additions)

-(MasterViewController*)addAnimation:(NSString*)transitionType;

@end