//
//  SettingViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/5/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *ibLanguagePickerView;
@property (strong, nonatomic) IBOutlet UIButton *btnLanguage;
@property (nonatomic,strong)NSArray* arrPickerList;
@end

@implementation SettingViewController
- (IBAction)btnBackClicked:(id)sender {
    [[self addAnimation:kCATransitionFade].navigationController popViewControllerAnimated:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSelfView];
    

    // Do any additional setup after loading the view from its nib.
}
-(void)initSelfView
{
    self.arrPickerList = @[@"ENGLISH", @"MALAY",@"CHiNESE"];
    [self.btnLanguage setTitle:[Utils playerPrefLanguage] forState:UIControlStateNormal];
    [self.ibLanguagePickerView selectRow:[Utils playerPrefLanguageToEnum] inComponent:0 animated:NO];
    [self.btnLanguage addTarget:self action:@selector(btnLangClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self showPickerView:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnLangClicked:(id)sender
{
    [self showPickerView:YES];
    NSLog(@"ggwp");
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.arrPickerList.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    
    return self.arrPickerList[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch ((Language)row) {
        default:
        case ENGLISH:
            [[LanguageManager sharedManager] LanguageDidSelect:ENGLISH];
            [self.btnLanguage setTitle:@"ENGLISH" forState:UIControlStateNormal];
            [Utils setPlayerPrefLanguage:@"ENGLISH"];

            break;
        case CHINESE:
            [[LanguageManager sharedManager] LanguageDidSelect:CHINESE];
            [self.btnLanguage setTitle:@"CHINESE" forState:UIControlStateNormal];
            [Utils setPlayerPrefLanguage:@"CHINESE"];

            break;
        case MALAY:
            [[LanguageManager sharedManager] LanguageDidSelect:MALAY];
            [self.btnLanguage setTitle:@"MALAY" forState:UIControlStateNormal];
            [Utils setPlayerPrefLanguage:@"MALAY"];

            break;

    }
    [self showPickerView:NO];
}

-(void)showPickerView:(BOOL)isShow
{
    
    self.ibLanguagePickerView.hidden = !isShow;
  
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
