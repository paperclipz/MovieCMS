//
//  LoginViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/4/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "LoginViewController.h"
#import "ConnectionManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "LoginModel.h"


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
    
    [self requestLogin];
   
}

-(void)invokeLogin
{
    if (_performLoginBlock) {
        [self addAnimation:kCATransitionFade];
        _performLoginBlock();
    }
}

-(void)validateLogin
{

    if ([[[DataManager sharedInstance]loginModel].status isEqualToString:@"success"]) {
        NSLog(@"YES i did it");
        [self invokeLogin];
    }
}

- (IBAction)btnSignupClicked:(id)sender {
    
    [self.ibRegisterView setHidden:NO];
    [self showRegisterView:YES];
}
- (IBAction)btnSigninFacebookClicked:(id)sender {
}
#pragma mark - Connection

-(BOOL)requestLogin
{
    __block BOOL isSuccess;
    NSDictionary *params = @ {@"username" :@"admin", @"password" :@"12345678"};

    [[ConnectionManager Instance] requestServerWithPost:YES requestType:ServerRequestType_Login param:params completeHandler:^(id object) {
        
     
        [self validateLogin];
        
    } errorBlock:^(id object) {

        isSuccess = false;

    }];
    return isSuccess;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSelfView];
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
