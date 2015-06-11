//
//  QRScannerViewController.h
//  MovieCMS
//
//  Created by Paperclipz on 6/2/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WinnerDisplayViewController.h"
#import "QRCodeReaderDelegate.h"

@interface QRScannerViewController : MasterViewController<QRCodeReaderDelegate>

@property (strong, nonatomic) WinnerDisplayViewController *winnerDisplayViewController;

@end
