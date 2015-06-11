//
//  QRScannerViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/2/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "QRScannerViewController.h"
#import "QRCodeReaderViewController.h"
#import "QRCodeReader.h"
@interface QRScannerViewController ()

@end

@implementation QRScannerViewController
- (IBAction)btnNextClicked:(id)sender {
    
    [self scanAction:sender];
    //[[self addAnimation:kCATransitionFade].navigationController pushViewController:self.winnerDisplayViewController animated:NO];
}
- (IBAction)btnBackClicked:(id)sender {
    
    [[self addAnimation:kCATransitionFade].navigationController popViewControllerAnimated:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(WinnerDisplayViewController*)winnerDisplayViewController
{
    if (!_winnerDisplayViewController) {
        _winnerDisplayViewController = [WinnerDisplayViewController new];
    }
    return _winnerDisplayViewController;
}

- (IBAction)scanAction:(id)sender
{
    if ([QRCodeReader supportsMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]]) {
        static QRCodeReaderViewController *reader = nil;
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            reader                        = [QRCodeReaderViewController new];
            reader.modalPresentationStyle = UIModalPresentationFormSheet;
        });
        reader.delegate = self;
        
        [reader setCompletionWithBlock:^(NSString *resultAsString) {
            NSLog(@"Completion with result: %@", resultAsString);
        }];
        
        [self.view addSubview:reader.view];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Reader not supported by the current device" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
}

#pragma mark - QRCodeReader Delegate Methods

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QRCodeReader" message:result delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    [self dismissViewControllerAnimated:YES completion:NULL];
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
