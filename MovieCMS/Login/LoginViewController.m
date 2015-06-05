//
//  LoginViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/4/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
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

#pragma mark -UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidBeginEditing");
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1.0f animations:^{
           CGRect tempFrame = CGRectMake(0, -[Utils getKeyboardHeight], weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
        weakSelf.view.frame = tempFrame;
    }];
 
    

}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
   
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1.0f animations:^{
        CGRect tempFrame = CGRectMake(0, 0, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
        weakSelf.view.frame = tempFrame;
    }];

    return YES;
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
