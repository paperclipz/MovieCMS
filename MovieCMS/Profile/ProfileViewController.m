//
//  ProfileViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *ibArrTextField;
@property (strong, nonatomic) IBOutlet UIButton *ibBtnBack;
@property (assign, nonatomic) BOOL isEditing;

@end

@implementation ProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSelfView];
      // Do any additional setup after loading the view from its nib.
}

-(void)initSelfView
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.ibBtnBack setTitle:@"" forState:UIControlStateNormal];
    [self.ibBtnBack addTarget:self action:@selector(btnBackClicked:) forControlEvents: UIControlEventTouchDown];
    for (int i = 0; i<self.ibArrTextField.count; i++) {
        UITextField* temp = self.ibArrTextField[i];
        temp.delegate = self;

    }
    [self makeTextFieldEditable:self.isEditing];

}

-(IBAction)btnBackClicked:(id)sender
{
    [[self addAnimation:kCATransitionFade].navigationController popViewControllerAnimated:NO];
}

-(void)makeTextFieldEditable:(BOOL)isEditable
{
    for (int i = 0;i<self.ibArrTextField.count;i++)
    {
        UITextField* tempTxtField =  self.ibArrTextField[i];
        tempTxtField.borderStyle = isEditable?UITextBorderStyleRoundedRect:UITextBorderStyleNone;
        tempTxtField.enabled = isEditable?YES:NO;
    }
    
    if (!isEditable) {
        [self keyboardDidShow:NO];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnEditClicked:(id)sender {

    self.isEditing = !self.isEditing;
    [self makeTextFieldEditable:self.isEditing];
    [(UIButton*)sender setTitle:self.isEditing?@"DONE":@"EDIT" forState:UIControlStateNormal];
}

#pragma mark -UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidBeginEditing");
    [self keyboardDidShow:YES];
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [super textFieldShouldReturn:textField];

    [self keyboardDidShow:NO];

    return YES;
}
-(void)keyboardDidShow:(BOOL)isShow
{
//    if (isShow) {
//        __weak typeof(self)weakSelf = self;
//        [UIView animateWithDuration:1.0f animations:^{
//            CGRect tempFrame = CGRectMake(0, -[Utils getKeyboardHeight], weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
//            weakSelf.view.frame = tempFrame;
//        }];
//
//    }
//    else{
//        __weak typeof(self)weakSelf = self;
//        [UIView animateWithDuration:1.0f animations:^{
//            CGRect tempFrame = CGRectMake(0, 0, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
//            weakSelf.view.frame = tempFrame;
//        }];
//    }
   

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
