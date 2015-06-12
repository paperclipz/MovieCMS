//
//  WinnerDisplayViewController.h
//  MovieCMS
//
//  Created by Paperclipz on 6/5/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRCodeReaderDelegate.h"

@interface WinnerDisplayViewController : MasterViewController<QRCodeReaderDelegate>
- (void)LoadScanner;

@end
