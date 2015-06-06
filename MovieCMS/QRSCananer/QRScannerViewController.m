//
//  QRScannerViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/2/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "QRScannerViewController.h"

@interface QRScannerViewController ()

@end

@implementation QRScannerViewController
- (IBAction)btnNextClicked:(id)sender {
    
    [[self addAnimation:kCATransitionFade].navigationController pushViewController:self.winnerDisplayViewController animated:NO];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
