//
//  MenuViewController.h
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

typedef void (^DidSelectMenuAtIndexBlock)(int index);
@interface MenuViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)MenuView* menuView;
@property (copy, nonatomic)DidSelectMenuAtIndexBlock didSelectMenuAtIndexBlock;
@property (nonatomic,copy)LanguageBlock languageBlock;

-(void)menuListDidChangeFromLogin;

@end


