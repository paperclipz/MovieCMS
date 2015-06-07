//
//  WinnerDisplayViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/5/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "WinnerDisplayViewController.h"
#import "WinnerDetailModel.h"
@interface WinnerDisplayViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *ibIVQRcode;
@property (strong, nonatomic) IBOutlet UILabel *ibTFName;
@property (strong, nonatomic) IBOutlet UILabel *ibTFIC;
@property (strong, nonatomic) IBOutlet UILabel *ibTFPrize;
@property (strong, nonatomic) IBOutlet UILabel *lblTFLocation;
@property (strong, nonatomic) IBOutlet UILabel *ibTFTime;

@property (strong, nonatomic) IBOutlet UIScrollView *ibSWContent;
@property (strong,nonatomic) WinnerDetailModel* winnerModel;
@end

@implementation WinnerDisplayViewController
- (IBAction)btnBackClicked:(id)sender {
    [[self addAnimation:kCATransitionFade].navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSelfView];
    [self initData];
    // Do any additional setup after loading the view from its nib.
}

-(void)initSelfView
{
    self.ibSWContent.delaysContentTouches = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayViewData
{
    self.ibTFName.text = self.winnerModel.name;
    self.ibTFIC.text = self.winnerModel.nric;
    self.ibTFPrize.text = self.winnerModel.prize;
    self.lblTFLocation.text = self.winnerModel.location;
    self.ibTFTime.text = self.winnerModel.time;
}
-(void)initData
{
    self.winnerModel = [WinnerDetailModel new];
    self.winnerModel.name = @"ANG BENG HONG";
    self.winnerModel.nric = @"9012020-10-1102";
    self.winnerModel.prize = @"x2 MOVIE PASS TO START WAR EPI VII";
    self.winnerModel.location = @"GSC PAVILLION";
    self.winnerModel.time = @"VALID TILL 25 JUN 2015";
    [self displayViewData];
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
