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
@property (strong, nonatomic) IBOutlet UIButton *ibBtnMenu;
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
    [self.ibBtnMenu setTitle:@"" forState:UIControlStateNormal];
    [self.ibBtnMenu addTarget:self action:@selector(toggleMenuOpen) forControlEvents: UIControlEventTouchDown];
    

}

-(void)makeTextFieldEditable:(BOOL)isEditable
{
    for (int i = 0;i<self.ibArrTextField.count;i++)
    {
        UITextField* tempTxtField =  self.ibArrTextField[i];
        tempTxtField.borderStyle = isEditable?UITextBorderStyleRoundedRect:UITextBorderStyleNone;
        tempTxtField.enabled = isEditable?YES:NO;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
