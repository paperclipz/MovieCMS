//
//  LoginViewController.h
//  MovieCMS
//
//  Created by Paperclipz on 6/4/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PerformLoginBlock)(void);

@interface LoginViewController : MasterViewController <UITextFieldDelegate>

@property (copy, nonatomic)PerformLoginBlock performLoginBlock;
@end
