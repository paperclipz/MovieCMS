//
//  LoginViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/4/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *ibIVLogo;
@property (strong, nonatomic) IBOutlet UIView *ibViewContent;
@property (strong, nonatomic) IBOutlet UIView *ibRegisterView;
@property (strong, nonatomic) IBOutlet UIButton *ibBtnCloseRegisterView;
@end

@implementation LoginViewController

- (IBAction)btnForgotPasswordClicked:(id)sender {
    
   
}
- (IBAction)btnLoginClicked:(id)sender {
    if (_performLoginBlock) {
         [self addAnimation:kCATransitionFade];
        _performLoginBlock();
    }
}
- (IBAction)btnSignupClicked:(id)sender {
    
    [self.ibRegisterView setHidden:NO];
    [self showRegisterView:YES];
}
- (IBAction)btnSigninFacebookClicked:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSelfView];
    
//    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
//    CGFloat adjusteHeight = (screenHeight - self.ibIVLogo.frame.origin.y - self.ibIVLogo.frame.size.height-self.ibViewContent.frame.size.height)/2;
//    
//    NSLog(@"%f == ibviewcontent ==%f",screenHeight,self.ibViewContent.frame.size.height);
//    self.ibViewContent.frame = CGRectMake(self.ibViewContent.frame.origin.x,self.ibIVLogo.frame.origin.y+self.ibIVLogo.frame.size.height+adjusteHeight, self.ibViewContent.frame.size.width, self.ibViewContent.frame.size.height);
  
    // Do any additional setup after loading the view from its nib.
}

-(void)initSelfView
{
    [self.ibRegisterView setHidden:YES];
    [self.ibBtnCloseRegisterView addTarget:self action:@selector(BtnCloseRegisterClicked:) forControlEvents:UIControlEventTouchUpInside];
   }

-(void)showRegisterView:(BOOL)isShow
{
    
    __weak typeof(self)weakSelf = self;
    
    self.ibRegisterView.frame = CGRectMake(0, isShow?self.view.frame.size.height:self.view.frame.size.height-self.ibRegisterView.frame.size.height, self.ibRegisterView.frame.size.width, self.ibRegisterView.frame.size.height);
    [UIView animateWithDuration:1.0f animations:^{

        float frame =weakSelf.view.frame.size.height - weakSelf.ibRegisterView.frame.size.height;
        CGRect tempFrame = CGRectMake(0,isShow?frame:weakSelf.view.frame.size.height, weakSelf.ibRegisterView.frame.size.width, weakSelf.ibRegisterView.frame.size.height);
        weakSelf.ibRegisterView.frame = tempFrame;
    }completion:^(BOOL finished) {
        if (!isShow) {
            [self.ibRegisterView setHidden:YES];
        }

    }];
}

-(IBAction)BtnCloseRegisterClicked:(id)sender
{
    [self showRegisterView:NO];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
