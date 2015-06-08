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
@property (nonatomic,strong)NSArray* arrPickerList;
@end

@implementation SettingViewController
- (IBAction)btnBackClicked:(id)sender {
    [[self addAnimation:kCATransitionFade].navigationController popViewControllerAnimated:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrPickerList = @[@"ENGLISH", @"CHiNESE", @"MALAY"];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSLog(@"selected at row == %d",row);
    switch (row) {
        case 0:
            [[LanguageManager sharedManager] LanguageDidSelect:ENGLISH];

            break;
        case 1:
            [[LanguageManager sharedManager] LanguageDidSelect:CHINESE];
            
            break;
        case 2:
            [[LanguageManager sharedManager] LanguageDidSelect:MALAY];
            
            break;
            
        default:
            break;
    }
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
